{
  plugins.hurl = {
    enable = true;
    settings = {
      formatters = {
        html = [
          "prettier"
          "--parser"
          "html"
        ];
        json = [
          "jq"
        ];
        xml = [
          "tidy"
          "-xml"
          "-i"
          "-q"
        ];
      };
      mode = "split";
    };
  };

  lean.enable = true;
  wakatime.enable = true;
}
