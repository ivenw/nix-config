{config, ...}: {
  programs.helix = {
    enable = true;
  };

  xdg.configFile."helix/config.toml" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/modules/home-manager/helix/config.toml";
  };
}
