# ProloNix

[![Build Status](https://travis-ci.com/erdnaxe/prolonix.svg?branch=master)](https://travis-ci.com/erdnaxe/prolonix)

Available configurations are in `config/`.
For now, only `semifinals-iso.nix` is tested.

## How to build

With Docker just run :

```bash
docker run --volume "$(pwd)/iso:/iso" --volume "$(pwd)/config:/config" \
    --rm -it nixos/nix \
    /bin/sh -c "nix-build -A config.system.build.isoImage \
    -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz \
    /config/semifinals-iso.nix && mv result/iso/* /iso/"
```

Without Docker you will need a working installation of nix and run :

```bash
nix-build -A config.system.build.isoImage config/semifinals-iso.nix \
    -I nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixos-20.03.tar.gz
```

