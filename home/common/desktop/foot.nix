{ pkgs, ... }: {
    
  programs.foot = {
    enable = true;

    settings = {
      main = {
        # term = "foot";
        shell = "fish";
        pad = "15x15";
        selection-target = "clipboard";
      };

      scrollback = {
        lines = 10000;
      };
    };
  };
};