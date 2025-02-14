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

push: 
	git push origin master

uni:
	nixos-rebuild switch --flake .#uni --use-remote-sudo |& nom

timy:
	nixos-rebuild switch --flake .#timy --use-remote-sudo --show-trace --option max-call-depth 10000 |& nom

spacy:
	nixos-rebuild switch --flake .#spacy --use-remote-sudo |& nom

debug: 
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
