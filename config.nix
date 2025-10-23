# Global flake configuration
{
  defaultSystems ? [
    "aarch64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
    "x86_64-linux"
  ],
}:
let
  forEachSystem =
    systems: f:
    builtins.listToAttrs (
      map (system: {
        name = system;
        value = f system;
      }) systems
    );
in
{
  forEachDefaultSystem = forEachSystem defaultSystems;

  users = {
    oahlen = {
      name = "oahlen";
      fullName = "Oscar Ahlén";
    };
  };
}
