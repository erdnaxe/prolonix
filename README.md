# ProloNix

## How to build

With Docker just run :

```bash
docker build --pull -t build_image .
docker run --volume "$(pwd)/iso:/iso" \
    --volume "$(pwd)/configuration.nix:/build/configuration.nix" \
    --rm -it build_image
```

Without Docker you will need a working installation of nix and run :

```bash
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage \
    -I nixos-config=configuration.nix --show-trace
```

