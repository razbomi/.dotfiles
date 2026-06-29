{ pkgs, ... }: {
  home.packages = [ pkgs.claude-code ];

  # claude's startup doctor checks this exact path, not PATH
  home.file.".local/bin/claude".source = "${pkgs.claude-code}/bin/claude";
}
