# What?

- This is my nix configuration aimed to get deployed on my personal machines:
  - Asus Zenbook duo 2024 (Timy)
  - Alienware X17 R1 (Uni)
  - Lenovo Yoga 720 (Spacy)
  - A home configuration that can be used universally on other generic machines (Earthy)
    - This is often used with home-manager only for cross OS compatibility.
  - [ ] servers (WIP)

# Why?

- Simple deployment. Eventually will support offline installation for local machines, according to [this](https://www.reddit.com/r/NixOS/comments/1co9spe/is_it_possible_to_do_offline_updates_of_nixpkgs/)
- Scalability. You can easily add a new configuration. Along with the first point, it makes configuring and deploying a new host easy as just running a single command.
- Maintenance. Maintaining takes a lot of work. Nix flake with git makes it easy to roll back in case of error.

# Future work

- [ ] Single command remote deployment
- [ ] Single command and offline local machine deployment
- [ ] Support servers running useful services
- [ ] installation scripts
