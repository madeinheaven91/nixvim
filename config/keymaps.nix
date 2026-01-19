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
      key = "<leader>q";
      action = ":q<CR>";
      options.desc = "Quit";
    }
    {
      mode = [ "n" ];
      key = "<leader>bq";
      action = ":bd<CR>";
      options.desc = "Delete buffer";
    }
    {
      mode = [ "n" ];
      key = "<leader>bo";
      action = ":%bd|e#<CR>";
      options.desc = "Delete other buffers";
    }
    {
      mode = [ "n" "v" "x" ];
      key = "<leader>y";
      action = lib.nixvim.mkRaw "function() vim.cmd('normal! \"+y') vim.notify('Yanked to system clipboard', vim.log.levels.INFO) end";
      options.desc = "Yank to sys clipboard";
    }
    {
      mode = [ "n" "v" "x" ];
      key = "<leader>x";
      action = lib.nixvim.mkRaw "function() vim.cmd('normal! \"+x') vim.notify('Yanked to system clipboard', vim.log.levels.INFO) end";
      options.desc = "Yank to sys clipboard";
    }
    {
      mode = [ "n" "v" "x" ];
      key = "<leader>p";
      action = "\"+p";
      options.desc = "Paste from sys clipboard";
    }
    {
      mode = [ "n" ];
      key = "<leader>ff";
      action = ":Pick files<CR>";
      options.desc = "List files";
    }
    {
      mode = [ "n" ];
      key = "<leader>fb";
      action = ":Pick buffers<CR>";
      options.desc = "List buffers";
    }
    {
      mode = [ "n" ];
      key = "<leader>fr";
      action = ":Pick oldfiles<CR>";
      options.desc = "List recent";
    }

    {
      mode = [ "n" ];
      key = "<leader>fk";
      action = ":Pick keymaps<CR>";
      options.desc = "List keymaps";
    }
    {
      mode = [ "n" ];
      key = "<leader>f\"";
      action = ":Pick registers<CR>";
      options.desc = "List registers";
    }
    {
      mode = [ "n" ];
      key = "<leader>gb";
      action = ":Pick git_branches<CR>";
      options.desc = "List git branches";
    }
    {
      mode = [ "n" ];
      key = "<leader>gc";
      action = ":Pick git_commits<CR>";
      options.desc = "List git commits";
    }
    {
      mode = [ "n" ];
      key = "<leader>gf";
      action = ":Pick git_files<CR>";
      options.desc = "List git files";
    }
    {
      mode = [ "n" ];
      key = "<leader>gg";
      action = ":Pick grep_live<CR>";
      options.desc = "List grep live";
    }
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = ":Oil<CR>";
      options.desc = "Open explorer";
    }
	];
}
