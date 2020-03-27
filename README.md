# ProloNix

[![Build Status](https://travis-ci.com/erdnaxe/prolonix.svg?branch=master)](https://travis-ci.com/erdnaxe/prolonix)

This repository contains two images configuration :

  * `config/iso-image.nix` builds an ISO file ready to be burnt to a DVD or USB
    device.
  * `config/netboot.nix` builds a netboot image.

For now, only the iso image is tested.

## How to build

With Docker just run :

```bash
docker run --volume "$(pwd)/iso:/iso" --volume "$(pwd)/config:/config" \
    --rm -it nixos/nix \
    /bin/sh -c "nix-build -A config.system.build.isoImage \
    -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz \
    /config/iso-image.nix && mv result/iso/* /iso/"
```

Without Docker you will need a working installation of nix and run :

```bash
nix-build -A config.system.build.isoImage config/iso-image.nix \
    -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz
```

