{pkgs, ...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    storageDriver = "btrfs";
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  users.extraGroups.docker.members = ["giuseppe"];
}
