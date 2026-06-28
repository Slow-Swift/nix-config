{ pkgs, ... }:
{
  # Define any custom packages here
  festival = pkgs.callPackage ./festival {};
}
