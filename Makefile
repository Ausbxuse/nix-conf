# Makefile for managing Nix configurations on a local machine

SHELL := /usr/bin/env bash
.SHELLFLAGS := -uc

# Variables
GENERATION := $$(nixos-rebuild list-generations --flake ".\#" | grep current)
NIX_FILES := $$(fd .nix)

# Phony targets for workflow
.PHONY: dconf install commit all show check format push build debug up upp history repl clean gc zsh-test nvim-test tmux-test

all: dconf format build commit push

dconf: 
	@rsync -av /home/zhenyu/.config/dconf/ ./home/gui/dconf

commit: format
	@git commit -a

show:
	echo $(GENERATION) >> README.md
check:
	@nix flake check
format:
	@alejandra . &>/dev/null

push: 
	@git push origin stable

build: dconf format
	@nixos-rebuild switch --flake . --use-remote-sudo |& nom

install:
	@nixos-rebuild switch --flake . --use-remote-sudo |& nom

debug: format
	@nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

update:
	@sudo nix flake update

# Update specific input
# usage: make upp i=home-manager
upp:
	@nix flake lock --update-input $(i)

history:
	@nix profile history --profile /nix/var/nix/profiles/system

repl:
	@nix repl -f flake:nixpkgs

clean:
	# Remove all generations older than 7 days
	@sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
	# Garbage collect all unused nix store entries
	@sudo nix-collect-garbage --delete-old

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
	rsync -avz --copy-links --chmod=D2755,F744 ./home/core/nvim/ ${HOME}/.config/nvim
