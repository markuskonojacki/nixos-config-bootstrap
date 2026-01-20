{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./defaults.nix
      ./ssh.nix
      ./packages.nix
      ./bash_aliases.nix
    ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # hostname
  networking.hostName = "bootstrap";

  # user account
  users.users.bootstrap = {
    isNormalUser = true;
    home = "/home/bootstrap";
    createHome = false;
    uid = 1001;
    description = "bootstrap user";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [ 
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfNuZBDROQ6pw+6ZaZpjqui68Z6/d1K+deDK9TNDuI8CVXYTU4cNVyO0RK+ce6It3/e1LizpcxgNgheTWpr6xuCpfrektaiHrrGiO6xOzZNPKPlwvjUN5F9OMWeiw5ioo5kV/ot1LVGLgo4y5zM4LFQrYOm9jGQAXTyBIScqoGLaqecRADdyWWsqV1az8/A2ahSD2KvHNWnZjgZy8b0rsP/8YGXOQNbZrAfsFra6GCJ7QTaQePUSpPzgcKmagDkCkJy5TaGOZe7vyu1sSzxBT72FEUsS5orjg2GozmnBoOcrkvbf4abjclj+Fysf/ernIvf8IH1qSRZ+ENJgel7Ymx"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDREjOV0758brX/WNech1lA6QFVvCw6FsQ5x8P/CFazkOKNqxLK/Yb6j77V6AeDwu8rCXTEq/F41qDh/5wN848lbRtWL7mL8a4pw39E2hpeDidzsvQI5MKXhQCoAkuwvIR7IBbbrVM7X0ogsk9QntQ2vbrfFiUDRxNYvNRYqqc+zI/FqS3rkhRZ8gakrNVwF6yCr8gAGEzsU9Nx3JdN/h8L5wMD9E5G97p2m3eV40OCBF2H3Zw8YJYuS3HTj4pOFA4sT4fhgCt4P5BfngIJp5bMghBYQHwnq+uX4jwEOnNXU0yIeNWFxdUgB5CNgcOXsUlGKFE+IyLmBbvYCMGGSM/JLFO9BYlKg3js4pS1cAbSDnFcW8YXPPmYDdc/raSKKrrFCmiOpg/UriLN1ZuTx/bxzHDfECso7MjqLhyaZ/OdZ2u5q0aYrDq6rfLrXph5dYOlowZKZhyA+KzVMRz0CUi+cmvNyxdUoVdx4HxRygbUrCYb8ahbPLOdP3Q4biN+ibFI/WLS69k5ZgOJ7qXFIy3WkbBldNe4o/DxOMA/KOvjiHOZrdCvvTrKFhnInJbQ//jaQtvz3dyWSaXX+3mrIc1PpPJ5ri6dvb0OdJS6owUf4/JHXf9ZViIedWDJWZbFM9fP0j3tJkh27EaCyu9SaYxrBSoQpm12r0NbLE9TRifRxQ=="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+6vRw7wfkreBSEGdzBTo1oNDN56iVYIQDk0xie3XYSOyEYfNsmaeizCLIHB0iZDWC1ncnkQVBJGkrH3KtNnTdGj4c2xG2vg8991jQ4aK8WvxVUBoVj0UrDjbwxs4wPhj+OysoBH6Ugm5y4TyHlSf4bhjfdE1FrfrnjaPfiivgPv+bji9EC0jiCtmeWsZZ+jgA089Z5JiJWHzp5GhzHga2XzqGf69CcOg1H2EF105FwroYUq+asshq1xhaHaEoAOyF2NjTBgYEQSuxzpEACgvDXzL951i4jZvJ+/8z6oqdmUrzaq8qEdyp6a7xEvWxm6Slqx7z6Xug5tl7GoVNnfZfMF/bKS3oxu6EgeAw40Y6moyHLy/G1Cho6BFavTJ2Km555Ojia1h972bjKtT0gGpL+87yoYBuXhqgvzxJ1cbzF7tH5i8l5fD06Vn3n6RhXJxWW4dAVFyGOvt6gClPMkB0/d3OiHk9DKrtGy6D8uyj0O4c67Xlgol/0nprFboMhQU="
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuvv5Wsv72AGXYy44svG20t20wB/sPt+LKJ2BQB12b6H0/Vz+BZ8yklkQSDd89v/IelxHQI6ODWpdV503OiYtDAZrATeFPH/0ux9ljCdo3nVTQ9e1elvcHQzcvdvdkEHJsx88pFVRLMTRcXbuPGFL+ZyUwBLZw8s9Q+aHM1Z6JO0PQP4IESa0gC+5AXf6yx6qvLfrfxGK38VgQ+vNhJ8HyYCx7pxN5zqs4hheDbHL03VFzhdh1WxE3m+0XUyXLBswtP2jzaM00ebAGw2FAbTcapqnhl9ZoOcxlkgsQ+7BDh5d6q1MtAX+gmT512OxsQXfKO15CFMQX+sOjvW9t9nLGxTIFuoAkzfXst0NrSZ0gBuUwdVURueMJ3GBnTc86DUTP7yUBWodfRDKGns7ro5Gnbf//OAB4WjzfQLhQZVFizyB+8Qiajl4EHGzo66eJsH3T4gNcYFfr4sQ4BqM1WPJ0PjeJ4BXUCuRpX1Cq60ULfrpjpf9Iy+uj8hmfwMqR1Qs="
    ];
    packages = with pkgs; [];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;  # This allows wheel group members to sudo without password
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}