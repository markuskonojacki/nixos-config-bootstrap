{ config, ... }:
{
  # networking
  networking.networkmanager.enable = true;

  # time zone.
  time.timeZone = "Europe/Berlin";

  # internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # console keymap
  console.keyMap = "de";
}