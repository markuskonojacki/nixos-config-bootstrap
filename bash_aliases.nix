{ config, ... }:
{
  # add bash aliases
  environment.shellAliases = {
    ".."="cd ..";
    copy="rsync -P";
    ls="ls -alFh --color=auto";
    ll="ls -alFh --color=auto";
    fu="sudo $(fc -ln -1)";
    sudo="sudo ";
    updt="cd /etc/nixos && sudo git pull && sudo nixos-rebuild switch --upgrade";
    tst="cd /etc/nixos && sudo git pull && sudo nixos-rebuild test";
    untar="tar -xzf";
    tarit="tar -cvzf";
    cp="cp -riv";
    mkdir="mkdir -vp";
    mv="mv -iv";
  };
}