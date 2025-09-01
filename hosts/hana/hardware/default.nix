{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: let
  cfg = config.custom.zram;
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  #
  # Boot
  #
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  #
  # File System
  #
  #
  # Swap
  swapDevices = [
  ];
  #
  # Boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/BABD-E0E6";
    fsType = "vfat";
    options = ["fmask=0077" "dmask=0077"];
  };
  #
  # Root
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=root"];
  };

  fileSystems."/persist" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=persist"];
  };

  fileSystems."/etc" = {
    device = "/persist/persist/etc";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=nix"];
  };

  fileSystems."/var/lib" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=lib"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=log"];
  };

  fileSystems."/etc/NetworkManager/system-connections" = {
    device = "/var/log/persist/etc/NetworkManager/system-connections";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=home"];
  };

  fileSystems."/persist/swap" = {
    device = "/dev/disk/by-uuid/7fe0c47f-d786-4b4c-8959-47ae62f30f1d";
    fsType = "btrfs";
    options = ["subvol=persist/swap"];
  };

  fileSystems."/root" = {
    device = "/persist/swap/persist/root";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/srv" = {
    device = "/persist/swap/persist/srv";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/var/lib/bluetooth" = {
    device = "/persist/swap/persist/var/lib/bluetooth";
    fsType = "none";
    options = ["bind"];
  };

  fileSystems."/var/spool" = {
    device = "/persist/swap/persist/var/spool";
    fsType = "none";
    options = ["bind"];
  };

  #
  # Others
  #
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
