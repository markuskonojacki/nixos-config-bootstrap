{ config, pkgs, ... }:
{
  # packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    git
    htop
    tmux
  ];
}