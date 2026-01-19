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
      options.desc = "Yank to sys clipboard";
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

    # {
    #   mode = [ "n" ];
    #   key = "<leader>cf";
    #   action = lib.nixvim.mkRaw ''
    #     function()
    #     	vim.lsp.buf.code_action({
    #     		context = { only = { 'source.addMissingImports' } },
    #     		apply = true,
    #     	})
    #     	vim.lsp.buf.code_action({
    #     		context = { only = { 'source.organizeImports' } },
    #     		apply = true,
    #     	})
    #     	vim.lsp.buf.format()
    #     end
    #   '';
    #   options.desc = "Format";
    # }
    {
      mode = [ "n" ];
      key = "<leader>ct";
      action = lib.nixvim.mkRaw "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
      options.desc = "Toggle inlay hints";
    }
    # {
    #   mode = [ "n" ];
    #   key = "<leader>ca";
    #   action = lib.nixvim.mkRaw "vim.lsp.buf.code.action";
    #   options.desc = "Code actions";
    # }
    {
      mode = [ "n" ];
      key = "<leader>cd";
      action = lib.nixvim.mkRaw "function() vim.diagnostic.open_float({ focusable = true }) end";
      options.desc = "Diagnostics";
    }
    {
      mode = [ "n" ];
      key = "<leader>cs";
      action = lib.nixvim.mkRaw "vim.lsp.buf.document_symbol";
      options.desc = "Symbols";
    }
    {
      mode = [ "n" ];
      key = "<leader>cr";
      action = lib.nixvim.mkRaw "vim.lsp.buf.rename";
      options.desc = "Rename symbol";
    }
    {
      mode = [ "n" ];
      key = "<leader>cR";
      action = lib.nixvim.mkRaw "vim.lsp.buf.references";
      options.desc = "References";
    }
    {
      mode = [ "n" ];
      key = "<leader>gd";
      action = lib.nixvim.mkRaw "vim.lsp.buf.definition";
      options.desc = "Go to definition";
    }
  ];
}
