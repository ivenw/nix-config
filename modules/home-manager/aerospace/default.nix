{config, ...}: {
  xdg.configFile."aerospace/aerospace.toml" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/modules/home-manager/aerospace/aerospace.toml";
  };
}
