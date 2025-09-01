{config, ...}: {
  programs.lazygit = {
    enable = true;
  };

  xdg.configFile."lazygit/config.yml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/lazygit/config.yml";
  };
}
