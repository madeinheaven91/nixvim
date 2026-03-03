{ pkgs, ... }:

let
  alabaster = pkgs.vimUtils.buildVimPlugin {
    name = "alabaster.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "p00f";
      repo = "alabaster.nvim";
      rev = "76ee17c34f13190d1a3532613c7ca946303f0ffe";
      hash = "sha256-U4MCkhJNKQWPVE5HC0zK6bU3ZMg4DQnheEqjAqxoGcQ=";
    };
  };
in

{
  config = {
    extraPlugins = [
      alabaster
    ];
    colorscheme = "alabaster";
  };
}
