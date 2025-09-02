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

  hardware.nvidia = {
    open = false;

    # Enable the nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

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
