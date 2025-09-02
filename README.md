# Machina

All my NixOS systems configuration in a single place.

## Hosts

1.  Hana - Personal Computer
2.  ~~TBD - Home Server~~

## Commands

Update flake

```
nix flake update
```

Evaluate and test flakes

```bash
nix flake check
```

Execute flake

```bash
sudo nixos-rebuild switch --flake <path>#<host>

# sudo nixos-rebuild switch --flake ~/Workspaces/machina#hana
```

## To Do

- [x] Setup flakes
- [x] Setup BTRFS
- [x] Setup plymouth
- [x] Improve boot speed
- [ ] Setup home manager
- [ ] Setup user
- [ ] Improve gaming performance
