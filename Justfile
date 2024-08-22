set shell := ["bash", "-uc"]

# GENERATION := $$(nixos-rebuild list-generations --flake ".\#" | grep current)
# NIX_FILES := $$(fd .nix)

#all: install

gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

dconf: 
	rsync -av ~/.config/dconf/ ./hosts/base/home/gnome/dconf

show:
	echo $(GENERATION) >> README.md

check:
	nix flake check

format:
	alejandra .

push: 
	git push origin master

install:
  ./scripts/install.sh

install-uni:
	nixos-rebuild switch --flake .#uni --use-remote-sudo |& nom

install-timy:
	nixos-rebuild switch --flake .#timy --use-remote-sudo |& nom

install-spacy:
	nixos-rebuild switch --flake .#spacy --use-remote-sudo |& nom

debug: format
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

update:
	nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
	nix flake lock --update-input $(i)

history:
	nix profile history --profile /nix/var/nix/profiles/system

repl:
	nix repl -f flake:nixpkgs

clean:
	# Remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
	# Garbage collect all unused nix store entries
	sudo nix-collect-garbage --delete-old

zsh:
	rsync -avz --delete --copy-links --chmod=D2755,F744 ./home/core/zsh/ ${HOME}/.config/zsh

tmux:
	rsync -avz --delete --chmod=D2755,F744 ./home/core/tmux/ ${HOME}/.config/tmux

nvim:
	rsync -avz --delete --copy-links --chmod=D2755,F744 ./hosts/base/home/tui/nvim/ ${HOME}/.config/nvim
