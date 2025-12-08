# nix config

My preferred KDE + Wayland Linux configuration using NixOS. Derived from [BedHedd's repo](https://github.com/BedHedd/nix-config).

Configured for GPU Passthrough with an NVIDIA card. Read more about the KVM config [here](./virt-manager.md).

```bash
nixos-rebuild switch --flake .#nixos
```

### SOPS

[SOPS](https://github.com/getsops/sops) is a way to encrypt files. I'm using it to encrypt sensitive content
(e.g. SSH keys, .gitconfig) that I want to share across machines. The Nix rebuild command will take care of everything
if the proper private key is located at `/var/lib/sops-nix/key.txt`.

**Note:** The target paths in `./modules/sops.nix` are hard-coded and may need to be updated.