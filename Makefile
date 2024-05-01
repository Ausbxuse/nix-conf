# Makefile for managing Nix configurations on a local machine

SHELL := /usr/bin/env bash
.SHELLFLAGS := -uc

# Variables
GENERATION := $$(nixos-rebuild list-generations --flake ".\#" | grep current)
NIX_FILES := $$(fd .nix)

# Phony targets for workflow
.PHONY: gen-dconf commit all show check format diff push build debug up upp history repl clean gc

all: commit format build push

gen-dconf:
	@dconf dump /  | sed "/^color-history/d" | dconf2nix > home/core/dconf.nix && alejandra home/core/dconf.nix &>/dev/null && sed -i '/world-clocks =/{N;N;N;N;d;}' home/core/dconf.nix  

commit:
	@git commit -a

show:
	echo $(GENERATION)
check:
	@nix flake check
format:
	@alejandra . &>/dev/null

diff:
	@git diff

push: 
	@git push origin master

build: format
	@nixos-rebuild switch --flake . --use-remote-sudo

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
