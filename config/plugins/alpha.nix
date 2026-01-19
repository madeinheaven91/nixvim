{ lib, ... }:

{
  plugins.alpha = {
    enable = true;
    settings = {
      layout = [
        {
          type = "padding";
          val = lib.nixvim.mkRaw "vim.fn.floor(vim.fn.winheight(0) * 0.3)";
        }
        {
          opts = {
            hl = "Type";
            position = "center";
          };
          type = "text";
          val = [
            "   _____                    _    ___         "
            "  / ___/      ______ _____ | |  / (_)___ ___ "
            "  \\__ \\ | /| / / __ `/ __ `/ | / / / __ `__ \\"
            " ___/ / |/ |/ / /_/ / /_/ /| |/ / / / / / / /"
            "/____/|__/|__/\\__,_/\\__, / |___/_/_/ /_/ /_/ "
            "                   /____/                    "
          ];
        }
        {
          type = "padding";
          val = 2;
        }
        {
          opts = {
            position = "center";
          };
          type = "text";
          val = "I'm ambidextrous. I slap ass with both hands.";
        }
        {
          opts = {
            position = "center";
          };
          type = "text";
          val = "- Ludacris";
        }
      ];
    };
  };
}
