{config, ...}: {
  programs.lazygit = {
    enable = true;
  };

  home.file."Library/Application Support/lazygit/config.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/lazygit/config.yml";
  };
}
