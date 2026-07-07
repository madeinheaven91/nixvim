{
  nixpkgs.config.allowUnfree = true;

  plugins.claude-code = {
    enable = true;
    settings = {
      window = {
        split_ratio = 0.5;
        position = "botright vertical";
      };
    };
  };
}
