# Machina

All my NixOS systems configuration in a single place.

## Hosts

1.  Hana - Personal Computer
2.  Sora - Home Server

## Setup

### Configuring secrets

First, add the ssh config to `~/.ssh/config` to the current machine.

```
Host github.com
        IdentitiesOnly yes
        IdentityFile ~/.ssh/<key>
```

**Obs.:** Make sure the key is configured in github

Then, get the machina secrets using the update command:

```
nix flake update machina-secrets --flake "<path>#<host>"
```

### Install

To install, run:

```
sudo nixos-rebuild switch --flake <path>#<host>
```

## To Do

1. Setup flake-parts
