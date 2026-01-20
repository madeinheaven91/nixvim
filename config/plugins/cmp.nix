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
          "<C-e>" = "cmp.mapping.abort()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-i>" = "cmp.mapping.scroll_docs(-4)";
          "<C-u>" = "cmp.mapping.scroll_docs(4)";
          "<C-CR>" =
            "cmp.mapping({
            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end
        })";
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
