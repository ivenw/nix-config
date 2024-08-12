{config, ...}: {
  xdg.configFile."wezterm/wezterm.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/modules/home-manager/wezterm/wezterm.lua";
  };
}
