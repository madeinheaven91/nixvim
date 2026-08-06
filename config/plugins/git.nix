{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add = {
          text = " ";
        };
        change = {
          text = " ";
        };
        delete = {
          text = " ";
        };
        untracked = {
          text = "";
        };
        topdelete = {
          text = "󱂥 ";
        };
        changedelete = {
          text = "󱂧 ";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>Gb";
      action = ":Pick git_branches<CR>";
      options.desc = "List git branches";
    }
    {
      mode = [ "n" ];
      key = "<leader>Gc";
      action = ":Pick git_commits<CR>";
      options.desc = "List git commits";
    }
    {
      mode = [ "n" ];
      key = "<leader>Gf";
      action = ":Pick git_files<CR>";
      options.desc = "List git files";
    }
    {
      mode = [ "n" ];
      key = "<leader>Gb";
      action = ":Gitsigns blame_line<CR>";
      options.desc = "List git files";
    }
    {
      mode = [ "n" ];
      key = "<leader>GB";
      action = ":Gitsigns blame<CR>";
      options.desc = "List git files";
    }
  ];
}
