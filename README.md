# ProloNix

This repository contains two images configuration :

  * `config/iso-image.nix` builds an ISO file ready to be burn to a DVD or USB
    device.
  * `config/netboot.nix` builds a netboot image.

For now, only the iso image is tested.

## How to build

With Docker just run :

```bash
docker build --pull -t build_image .
docker run --volume "$(pwd)/iso:/iso" --volume "$(pwd)/config:/config" \
    --rm -it build_image
```

Without Docker you will need a working installation of nix and run :

```bash
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage \
    -I nixos-config=config/iso-image.nix --show-trace
```

