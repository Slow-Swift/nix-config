#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <project-name> [--groupId=com.example] [--main-class=Main]"
  exit 1
fi

NAME="$1"
GROUPID="com.slowswift"
MAINCLASS="Main"

# Parse extra flags
for arg in "$@"; do
  case $arg in
  --groupId=*)
    GROUPID="${arg#*=}"
    ;;
  --main-class=*)
    MAINCLASS="${arg#*=}"
    ;;
  esac
done

mkdir -p "$NAME"
cd "$NAME"

# --- Create flake.nix + .envrc ---
cat >flake.nix <<EOF
{
  description = "Java project dev environment for $NAME";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.\${system}.default = pkgs.mkShell {
        buildInputs = [ pkgs.jdk pkgs.maven ];
      };
    };
}
EOF

echo "use flake" >.envrc
direnv allow >/dev/null || true

# --- Generate Maven project inside dev shell ---
nix develop -c mvn archetype:generate \
  -DgroupId="$GROUPID" \
  -DartifactId="$NAME" \
  -DarchetypeArtifactId=maven-archetype-quickstart \
  -DinteractiveMode=false

mv "$NAME"/* . && rm -rf "$NAME"

# --- Remove default test sources ---
rm -rf src/test

# --- Replace generated App.java with custom class ---
PACKAGE_PATH="src/main/java/$(echo "$GROUPID" | tr . /)"
rm -f "$PACKAGE_PATH/App.java"

mkdir -p "$PACKAGE_PATH"
cat >"$PACKAGE_PATH/$MAINCLASS.java" <<EOF
package $GROUPID;

public class $MAINCLASS {
    public static void main(String[] args) {
        System.out.println("Hello from $GROUPID.$MAINCLASS!");
    }
}
EOF

# --- Configure exec-maven-plugin ---
FQCN="$GROUPID.$MAINCLASS"
echo "⚙️  Adding exec-maven-plugin with mainClass=$FQCN"

sed -i '/<\/project>/i\
  <build>\n    <plugins>\n      <plugin>\n        <groupId>org.codehaus.mojo</groupId>\n        <artifactId>exec-maven-plugin</artifactId>\n        <version>3.1.0</version>\n        <configuration>\n          <mainClass>'"$FQCN"'</mainClass>\n        </configuration>\n      </plugin>\n    </plugins>\n  </build>' pom.xml

echo "✅ Project $NAME created successfully!"
echo "👉 Next steps:"
echo "  cd $NAME"
echo "  nix develop"
echo "  mvn package"
echo "  mvn exec:java   # runs $FQCN"
