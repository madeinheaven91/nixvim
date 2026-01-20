{
  plugins = {
    cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = false;
        };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "git"; }
          { name = "buffer"; }
        ];
        mapping = {
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-i>" = "cmp.mapping.scroll_docs(-4)";
          "<C-u>" = "cmp.mapping.scroll_docs(4)";
          "<C-h>" = "cmp.mapping.complete()";
          "<C-y>" = "cmp.mapping.confirm({ select = true })";
          "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-buffer = {
      enable = true;
    };
  };
}
