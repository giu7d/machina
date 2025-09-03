{
  config,
  lib,
  ...
}: {
  boot.kernelParams = ["amdgpu.backlight=0"]; # disable amdgpu backlight control

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
