{ pkgs, config, lib, ... }: {
  imports = [ ./hardware.nix ];

  modules = {
    shell = {
      default = "fish";
      git.enable = true;
      gnupg.enable = true;
    };

    networking = {
      networkManager.enable = true;
      # borsippaNET.enable = true;
    };

    services = { ssh.enable = true; };

    containers.transmission = {
      enable = false; # TODO: Once fixed -> enable = true;
      username = "alonzo";
      #  password = builtins.readFile config.age.secrets.torBylon.path;
    };

    develop = {
      dart.enable = true;
      haskell.enable = true;
      python.enable = true;
      rust.enable = true;
    };

    themes.active = "tokyonight";

    desktop = {
      xmonad.enable = true;
      terminal = {
        default = "alacritty";
        alacritty.enable = true;
      };
      editors = {
        default = "nvim";
        emacs.irkalla.enable = true;
        neovim.agasaya.enable = true;
      };
      browsers = {
        default = "firefox-devedition";
        ungoogled.enable = true;
        firefox.enable = true;
      };
      education = {
        memory.enable = true;
        vidcom.enable = true;
      };
      toolset = {
        downloader.transmission.enable = true;
        graphics = {
          raster.enable = true;
          vector.enable = true;
        };
        player = {
          music.enable = true;
          video.enable = true;
        };
        social.base.enable = true;
        # docView.sioyek.enable = true;
        docView.zathura.enable = true;
      };
    };
  };
}
