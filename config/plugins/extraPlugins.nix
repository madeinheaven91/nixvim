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
  closebuffer = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-closebuffer";
    src = pkgs.fetchFromGitHub {
      owner = "caesar003";
      repo = "nvim-closebuffer";
      rev = "3229179b62eff7c5648b5843f305582edf046118";
      hash = "sha256-GKUqrgHgW9ueTm7unUN6kuCVJR/I/D5yX98N4HYSbDU=";
    };
  };
in

{
  config = {
    extraPlugins = [
      alabaster
      closebuffer
    ];
    colorscheme = "alabaster";
  };
}
