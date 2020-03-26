# ProloNix

## How to build

With Docker just run :

```bash
docker build --pull -t build_image .
docker run --volume "$(pwd)/iso:/build/result/iso" \
    --volume "$(pwd)/configuration.nix:/build/configuration.nix" \
    --rm -it build_image
```

