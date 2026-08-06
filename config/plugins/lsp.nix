{ pkgs, lib, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        rust
        go
        typescript
        tsx
        svelte
        html
        css
        sql
        dockerfile
        yaml
        python
        dart
        c_sharp
        xml
      ];
    };
    treesitter-textobjects.enable = true;
    lsp-lines.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        html.enable = true;
        cssls.enable = true;
        jsonls.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        dartls.enable = true;
        csharp_ls = {
          enable = true;
        };
        lemminx = {
          enable = true;
          filetypes = [
            "xml"
            "xaml"
            "axaml"
            "xsd"
            "xsl"
            "xslt"
            "svg"
          ];
        };
        sqls = {
          enable = true;
          filetypes = [
            "sql"
            "mysql"
            "plsql"
          ];
        };
        dockerls = {
          enable = true;
          filetypes = [ "dockerfile" ];
        };
        yamlls = {
          enable = true;
          filetypes = [
            "yaml"
            "yml"
          ];
          settings = {
            yaml = {
              schemas = {
                # Docker Compose schema
                "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                  "docker-compose*.yml";
                # Kubernetes schemas
                "kubernetes" = "/*.yaml";
              };
              validate = true;
              completion = true;
              hover = true;
            };
          };
        };
        ts_ls = {
          enable = true;
          cmd = [
            "typescript-language-server"
            "--stdio"
          ];
          filetypes = [
            "javascript"
            "javascriptreact"
            "javascript.jsx"
            "typescript"
            "typescriptreact"
            "typescript.tsx"
          ];
        };
        svelte = {
          enable = true;
          filetypes = [
            "svelte"
          ];
        };
        marksman.enable = true;
        pyright.enable = true;
        gopls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };

        qmlls.enable = true;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };

    none-ls = {
      enable = true;
    };

    nvim-ufo.enable = true;
  };

  extraConfigLua = ''
    local _border = "rounded"

    local orig_hover = vim.lsp.buf.hover
    vim.lsp.buf.hover = function(config)
      config = config or {}
      config.border = config.border or _border
      return orig_hover(config)
    end

    local orig_signature_help = vim.lsp.buf.signature_help
    vim.lsp.buf.signature_help = function(config)
      config = config or {}
      config.border = config.border or _border
      return orig_signature_help(config)
    end

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "treesitter" }
      end
    })
  '';

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>cf";
      action = lib.nixvim.mkRaw ''
        function()
        	vim.lsp.buf.code_action({
        		context = { only = { 'source.addMissingImports' } },
        		apply = true,
        	})
        	vim.lsp.buf.code_action({
        		context = { only = { 'source.organizeImports' } },
        		apply = true,
        	})
        	vim.lsp.buf.format()
        end
      '';
      options.desc = "Format";
    }
    {
      mode = [ "n" ];
      key = "<leader>ct";
      action = lib.nixvim.mkRaw "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
      options.desc = "Toggle inlay hints";
    }
    {
      mode = [ "n" ];
      key = "<leader>ca";
      action = lib.nixvim.mkRaw "vim.lsp.buf.code_action";
      options.desc = "Code actions";
    }
    {
      mode = [ "n" ];
      key = "<leader>cd";
      action = lib.nixvim.mkRaw "function() vim.diagnostic.open_float({ focusable = true }) end";
      options.desc = "Line diagnostics";
    }
    {
      mode = [ "n" ];
      key = "<leader>cD";
      action = lib.nixvim.mkRaw "function() MiniExtra.pickers.diagnostic({ scope = 'all' }) end";
      options.desc = "Workspace diagnostics";
    }
    {
      mode = [ "n" ];
      key = "<leader>cr";
      action = lib.nixvim.mkRaw "vim.lsp.buf.rename";
      options.desc = "Rename symbol";
    }
    {
      mode = [ "n" ];
      key = "<leader>gr";
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
