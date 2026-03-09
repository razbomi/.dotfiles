{ ... }: {
  programs.btop = {
    enable = true;
    settings = {
      theme_background = true;
      truecolor = true;
      vim_keys = false;
      rounded_corners = true;
      terminal_sync = true;
      graph_symbol = "braille";
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";
    };
  };
}
