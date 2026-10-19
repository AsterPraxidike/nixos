# installing to new system (using nixos iso)
nixos-anywhere --flake .#<config name> --generate-hardware-config nixos-generate-config ./testVM/hardware.nix nixos@<ip or fqdn>

## example
nixos-anywhere --flake .#testVM --generate-hardware-config nixos-generate-config ./testVM/hardware.nix nixos@172.16.40.135


nixos-anywhere -f .#testVM root@172.16.40.135

# psuhing to existing nixos system

## building without deploying
nixos-rebuild build --flake .#<config name>
### can add --target-host to push without applying
nixos-rebuild build --flake .#<config name> --target-host <user>@<ip or fqnd>

## build and push (switching the remote system to the new system)
nixos-rebuild switch --flake .#<config name> --target-host <user>@<ip or fqnd>

## build and push (applying wihtout saving to bootloader)
nixos-rebuild test --flake .#<config name> --target-host <user>@<ip or fqnd>

## build and push (applies on next boot)
nixos-rebuild boot --flake .#<config name> --target-host <user>@<ip or fqnd>