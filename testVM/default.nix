{lib, pkgs, ...}:{
  system.stateVersion = "26.05";
  networking.hostName = "testVM";
  imports = [
    ./disko.nix
    ./hardware.nix
  ];

  # Packages installed system-wide
  environment.systemPackages = with pkgs; [
    htop
    git
    vim
  ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.mutableUsers = false;
  users.users.root.password = "password123";
  networking.useDHCP = true;
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };
}