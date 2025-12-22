{ config, ... }:
{
  # OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "no";
  services.openssh.settings.AllowUsers = [ "bootstrap" ];
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitEmptyPasswords = false;
}