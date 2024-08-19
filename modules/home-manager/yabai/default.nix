{config, ...}: {
  xdg.configFile."yabai/yabairc" = {
    source =
      config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/nix-config/modules/home-manager/yabai/yabairc";
  };
}
