{lib, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      # nixos
      # nix-system-update-now = "sudo nixos-rebuild switch --flake ~/nixos-config";
      # nix-system-update-on-reboot = "sudo nixos-rebuild boot --flake ~/nixos-config && systemctl reboot";
      # nix-home-update = "home-manager switch --flake ~/nixos-config";
      # nix-upgrade = "nix flake update --flake ~/nixos-config";
      # nix-config = "cd ~/nixos-config";
      # switch-to-configuration = "sudo /nix/var/nix/profiles/system/bin/switch-to-configuration switch";
      # cleanup = "nix-env --delete-generations +1 && switch-to-configuration && sudo nix-collect-garbage -d";

      darwin-apply = "sudo darwin-rebuild switch --flake ~/nix-config";

      lg = "lazygit";
      ya = "yazi";
      nv = "nvim";
    };
    oh-my-zsh = {
      enable = true;
    };

    initContent = lib.mkBefore ''
      export PATH=$HOME/.cargo/bin:$PATH
      export PATH=$HOME/.local/bin:$PATH
      export PATH=$HOME/.bun/bin:$PATH
      export PATH=$HOME/.opencode/bin:$PATH
    '';
  };
}
