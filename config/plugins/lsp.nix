{ pkgs, ... }:
{
  plugins = {
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
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
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
