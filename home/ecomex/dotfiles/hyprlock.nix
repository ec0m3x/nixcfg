{
  inputs,
  ...
}: {

  home.file.".config/hypr/hyprlock.conf" = {
    source = "${inputs.dotfiles}/hyprlock.conf";
  };
}