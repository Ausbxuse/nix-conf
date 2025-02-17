# A list of useful commands

## Install system

```bash
just install <host>
```

# Install nixos

1. Install using graphical installer
2. remember to make sure hardware configuration and luks setup are correct
3. Reboot and install my system setup using

```bash
nix --flake swith
nixos-rebuild switch --flake github:ausbxuse/nix-conf#<host-system>
```

3. Install home setup using

```bash
home-manager switch --flake github:ausbxuse/nix-conf#<host-home>
```

# Build iso

```bash
nix build .#gnome-iso
```

> NOTE: For lenovo yoga, add thinkpad-acpi to kernelModules
