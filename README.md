# nix config

My preferred KDE + Wayland Linux configuration using NixOS. Derived from [BedHedd's repo](https://github.com/BedHedd/nix-config).

Configured for GPU Passthrough with an NVIDIA card.

```bash
nixos-rebuild switch --flake .#nixos
```