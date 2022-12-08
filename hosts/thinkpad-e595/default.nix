{ pkgs
, config
, lib
, ...
}: {
  imports = [ ./hwCfg.nix ];

  modules = {
    networking = {
      enable = true;
      networkManager.enable = true;
      # akkadianVPN.enable = true;
    };

    themes.active = "tokyonight";

    desktop = {
      xmonad.enable = true;
      terminal = {
        default = "wezterm";
        wezterm.enable = true;
      };
      editors = {
        default = "nvim";
        helix.enable = true;
        neovim = {
          agasaya.enable = true;
          # ereshkigal.enable = true;
        };
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
        social.common.enable = true;
        # docView.sioyek.enable = true;
        docView.zathura.enable = true;
      };
      distraction = {
        hardware.amdvlk.enable = true;
        lutris = {
          enable = true;
          league.enable = true;
        };
      };
    };

    develop = {
      haskell.enable = true;
      python.enable = true;
      rust.enable = true;
    };

    containers.transmission = {
      enable = false; # TODO: Once fixed -> enable = true;
      username = "alonzo";
      #  password = builtins.readFile config.age.secrets.torBylon.path;
    };

    shell = {
      git.enable = true;
      fish.enable = true;
      gnupg.enable = true;
    };
  };

  services = {
    upower.enable = true;
    printing.enable = true;

    xserver = {
      videoDrivers = [ "amdgpu" ];
      deviceSection = ''
        Option "TearFree" "true"
      '';

      libinput.touchpad = {
        accelSpeed = "0.5";
        accelProfile = "adaptive";
      };
    };
  };
}
