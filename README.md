# Introduction

This repo contains my nix configuration for both Linux and Mac installations.

## Fresh Installation Instructions

### On Mac

#### 1. Install Nix

```sh
sh <(curl -L https://nixos.org/nix/install)
```

#### 2. Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### 3. Clone this repo

```sh
cd ~ && git clone https://github.com/ivenw/nix-config
```

#### 4. Install

```sh
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/nix-config
```
