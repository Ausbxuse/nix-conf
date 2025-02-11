#!/usr/bin/env bash

set -e

NIX_INSTALL_URL="https://nixos.org/nix/install"
GIT_CONFIG_REPO="https://github.com/ausbxuse/nix-conf"
GIT_BRANCH="dev"

if ! command -v nix &> /dev/null; then
    echo "Installing Nix..."
    sh <(curl -L $NIX_INSTALL_URL) --daemon
    # Load Nix for the current shell
    . ~/.nix-profile/etc/profile.d/nix.sh

    exec "$SHELL" "$0"
fi

echo "Cloning Git configuration repository..."
if [ ! -d "$HOME/.config/git" ]; then
    mkdir -p "$HOME/src/public"
    git clone "$GIT_CONFIG_REPO" -b "$GIT_BRANCH" "$HOME/src/public/nix-conf"
else
    echo "Git config repo already exists, skipping."
fi

echo "Running nix home-manager switch..."
cd "$HOME/src/public/nix-conf"
sed -i \
  -e "s/username = \"[^\"]*\";/username = \"$(whoami)\";/g" \
  -e "s|user-homedir = \"/home/[^\"]*\";|user-homedir = \"$(echo $HOME)\";|g" \
  -e "s/hostname = \"[^\"]*\";/hostname = \"$(hostname)\";/g" \
  ./flake.nix
mkdir -p ~/.config/nix && echo 'extra-experimental-features = nix-command flakes' >>~/.config/nix/nix.conf
nix run nixpkgs#home-manager -- switch --flake .#earthy

if ! grep -q "$(command -v zsh)" /etc/shells; then
    echo "Authorizing Zsh as a valid shell..."
    echo "$(command -v zsh)" | sudo tee -a /etc/shells
fi

echo "Changing default shell to Zsh..."
chsh -s "$(command -v zsh)"

# echo "Remapping Caps Lock to Ctrl..."
# setxkbmap -option ctrl:nocaps

echo "Installation and setup complete!"
