# Introduction

This repo contains my nix configuration for both Linux and Mac installations.

## Fresh Installation Instructions

### On Mac

#### 1. Install Nix with [nix-installer](https://github.com/DeterminateSystems/nix-installer)

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
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

#### 5. Initialize tmux

Run:

```sh
tmux source ~/.config/tmux/tmux.conf
```

Then install tmux plugins by pressing <kbd>prefix</kbd> + <kbd>I</kbd>.

#### 6. Use

After installing, configuration changes can be applied to the system running:

```sh
darwin-rebuild switch --flake ~/nix-config 
```
