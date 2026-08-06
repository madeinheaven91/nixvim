{ lib, ... }:

{
  plugins = {
    oil.enable = true; # filebrowser
    mini-pick.enable = true; # picker

    # code symbols
    aerial = {
      enable = true;
      settings = {
        backends = [
          "lsp"
          "treesitter"
          "markdown"
          "man"
        ];
        attach_mode = "global";
        highlight_on_hover = true;
        disable_max_lines = 5000;
      };
    };

    # integration with tmux
    tmux-navigator = {
      enable = true;
      keymaps = [
        {
          action = "left";
          key = "<C-w>h";
        }
        {
          action = "down";
          key = "<C-w>j";
        }
        {
          action = "up";
          key = "<C-w>k";
        }
        {
          action = "right";
          key = "<C-w>l";
        }
        {
          action = "previous";
          key = "<C-w>\\";
        }
      ];
    };

    # undotree
    undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>AerialToggle<CR>";
      options.desc = "Code symbols";
    }
    {
      mode = [ "n" ];
      key = "<leader>e";
      action = ":Oil<CR>";
      options.desc = "Open explorer";
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
      key = "<leader>fg";
      action = ":Pick grep_live<CR>";
      options.desc = "List grep live";
    }
    {
      mode = [ "n" ];
      key = "<leader>cn";
      action = lib.nixvim.mkRaw "Snacks.notifier.show_history";
      options.desc = "Notification history";
    }
  ];
}
