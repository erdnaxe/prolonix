FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixos-20.03 nixpkgs
RUN nix-channel --update

WORKDIR /build

CMD nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=configuration.nix --show-trace
