{
  config,
  lib,
  pkgs,
  ...
}: {
  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  # Accept nvidia licenses
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.nvidia = {
    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "570.195.03";
      sha256_64bit = "sha256-1H3oHZpRNJamCtyc+nL+nhYsZfJyL7lgxPUxvXrF3B4=";
      sha256_aarch64 = "sha256-o4rgB6vo+Cv90lJywovIyVARRGS3R15zYQUj+f1nzWQ=";
      openSha256 = "sha256-vCBB/UJgVKHlSEWdgoF45lODr3YJmR6JwjrwWgWszBw=";
      settingsSha256 = "sha256-mjKkMEPV6W69PO8jKAKxAS861B82CtCpwVTeNr5CqUY=";
      persistencedSha256 = "sha256-BMpo2PIabhHjZQqUQi/W5DYhgAPmfCdFvXdN6ND2Bfs=";
    };

    modesetting.enable = true;

    powerManagement.enable = false;

    powerManagement.finegrained = false;

    prime = {
      sync.enable = true;
      amdgpuBusId = "PCI:05:0:0"; # integrated
      nvidiaBusId = "PCI:01:0:0"; # dedicated
    };
  };

  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = ["on-the-go"];
      hardware.nvidia.prime = {
        sync.enable = lib.mkForce false;
        offload.enable = lib.mkForce true;
        offload.enableOffloadCmd = lib.mkForce true;
      };
    };
  };
}
