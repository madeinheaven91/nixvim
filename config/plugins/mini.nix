{ lib, ... }:
{
  plugins = {
    mini-pick.enable = true;
    mini-extra.enable = true;
    mini-indentscope = {
      enable = true;
      settings = {
        draw = {
          delay = 100;
          predicate = lib.nixvim.mkRaw "function (scope) return not scope.body.is_incomplete end";
          priority = 2;
        };
        mappings = {
          goto_bottom = "]i";
          goto_top = "[i";
          object_scope = "ii";
          object_scope_with_border = "ai";
        };
        options = {
          border = "both";
          indent_at_cursor = true;
          n_lines = 10000;
          try_as_border = false;
        };
        symbol = "│";
      };
    };
    mini-hipatterns = {
      enable = true;
      settings = {
        delay = {
          scroll = 50;
          text_change = 200;
        };
        highlighters = lib.nixvim.mkRaw ''
          {
            fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'DiagnosticVirtualTextError' },
            hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'DiagnosticVirtualTextWarn' },
            todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'DiagnosticVirtualTextHint' },
            note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'DiagnosticVirtualTextInfo' },
            hex_color = require 'mini.hipatterns'.gen_highlighter.hex_color(),
          }
        '';
      };
    };
  };
}
