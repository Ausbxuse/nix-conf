set shell := ["bash", "-uc"]

# GENERATION := $$(nixos-rebuild list-generations --flake ".\#" | grep current)
# NIX_FILES := $$(fd .nix)


#all: install

gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now

dconf: 
	rsync -av ~/.config/dconf/ ./hosts/base/home/gnome/dconf

commit: format
	git commit -a

show:
	echo $(GENERATION) >> README.md

check:
	nix flake check

format:
	alejandra . &>/dev/null

push: 
	git push origin stable

build: dconf format
	nixos-rebuild switch --flake . --use-remote-sudo |& nom

install:
  ./scripts/install.sh

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

zsh-clean:
	rm -rf ${HOME}/.config/zsh
zsh-test: zsh-clean
	rsync -avz --copy-links --chmod=D2755,F744 ./home/core/zsh/ ${HOME}/.config/zsh

tmux-clean:
	rm -rf ${HOME}/.config/tmux
tmux-test: tmux-clean
	rsync -avz --chmod=D2755,F744 ./home/core/tmux/ ${HOME}/.config/tmux

nvim-clean:
	rm -rf ${HOME}/.config/nvim
nvim-test: nvim-clean
	rsync -avz --copy-links --chmod=D2755,F744 ./hosts/base/home/tui/nvim/ ${HOME}/.config/nvim
