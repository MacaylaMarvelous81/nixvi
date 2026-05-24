{ ... }:
{
  plugins.markview = {
    enable = true;
    settings = {
      markdown = {
        headings.__raw = "require(\"markview.presets\").headings.glow";
        horizontal_rules.__raw = "require(\"markview.presets\").horizontal_rules.dashed";
        tables.__raw = "require(\"markview.presets\").single";
      };
    };
  };
}
