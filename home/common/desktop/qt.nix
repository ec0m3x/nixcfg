{ pkgs, self, ... }:
let
  theme = import "${self}/lib/theme" { inherit pkgs; };
in
{
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [
      theme.qtTheme.package
      libsForQt5.qtstyleplugin-kvantum
    ];
    sessionVariables = {
      "QT_STYLE_OVERRIDE" = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=${theme.qtTheme.name}
    '';
  };
}
