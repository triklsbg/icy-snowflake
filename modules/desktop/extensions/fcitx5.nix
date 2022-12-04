{ options
, config
, lib
, pkgs
, ...
}:
with lib;
with lib.my;

let cfg = config.modules.desktop.extensions.fcitx5;
in {
  options.modules.desktop.extensions.fcitx5 = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-configtool
        fcitx5-chinese-addons
        # fcitx5-mozc
        # fcitx5-hangul
        my.fcitx5-catppuccin
      ];
    };

    environment.variables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
    };
  };
}
