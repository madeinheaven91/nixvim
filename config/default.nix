{ lib, ... }:
{
  imports = [
    ./plugins
    ./settings.nix
    ./keymaps.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "codeium"
    ];

}
