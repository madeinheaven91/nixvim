{ lib, ... }:

{
  globals.mapleader = " ";

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>s";
      action = ":w<CR>";
      options.desc = "Save";
    }
    {
      mode = [ "n" ];
      key = "<leader>uw";
      action = ":set wrap!<CR>";
      options.desc = "Toggle wrap";
    }
    {
      mode = [ "n" ];
      key = "<leader>q";
      action = ":q<CR>";
      options.desc = "Quit";
    }
    {
      mode = [ "n" ];
      key = "<leader>bq";
      action = ":<C-U>bprevious <bar> bdelete #<CR>";
      options.desc = "Delete buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bo";
      action = ":%bd|e#<CR>";
      options.desc = "Delete other buffers";
    }
    {
      mode = [ "n" ];
      key = ''<leader>"'';
      action = ":split<CR>";
      options.desc = "Horizontal split";
    }
    {
      mode = [ "n" ];
      key = "<leader>%";
      action = ":vsplit<CR>";
      options.desc = "Vertical split";
    }
    {
      mode = [
        "n"
        "v"
        "x"
      ];
      key = "<leader>y";
      action = lib.nixvim.mkRaw "function() vim.cmd('normal! \"+y') vim.notify('Yanked to system clipboard', vim.log.levels.INFO) end";
      options.desc = "Yank to sys clipboard";
    }
    {
      mode = [
        "n"
        "v"
        "x"
      ];
      key = "<leader>x";
      action = lib.nixvim.mkRaw "function() vim.cmd('normal! \"+x') vim.notify('Yanked to system clipboard', vim.log.levels.INFO) end";
      options.desc = "Cut to sys clipboard";
    }
    {
      mode = [
        "n"
        "v"
        "x"
      ];
      key = "<leader>p";
      action = "\"+p";
      options.desc = "Paste from sys clipboard";
    }
  ];
}
