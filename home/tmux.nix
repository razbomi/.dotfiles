{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = true;
    mouse = true;
    prefix = "C-a";
    keyMode = "vi";
    baseIndex = 1;
    terminal = "tmux-256color";
    escapeTime = 0;
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      # Terminal settings (Ghostty)
      set -as terminal-features ",xterm-ghostty:RGB"
      set -g set-titles on
      set -g set-titles-string "#S"

      # Display settings
      setw -g pane-base-index 1
      set -g renumber-windows on

      # Split panes using | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      # Copy (v/V/r to select, y to yank, mouse drag to copy)
      bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "pbcopy"
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'V' send -X select-line
      bind-key -T copy-mode-vi 'r' send -X rectangle-toggle
      bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'pbcopy'

      # Status bar
      set -g status-left-length 100
      set -g status-left ""

      set -g status-right-length 100
      set -g status-right "#[fg=#{@thm_crust},bg=#{@thm_peach}]#[reverse]#[noreverse]󰸏 "
      set -ag status-right "#[fg=#{@thm_fg},bg=#{@thm_surface_1}] #(cut -f1 -w ~/.aws_current_profile):#(cut -f2 -w ~/.aws_current_profile)#[fg=#{@thm_surface_1}, bg=#{@thm_crust}] "
      set -ag status-right "#[fg=#{@thm_crust},bg=#{@thm_blue}]#[reverse]#[noreverse]󱃾 "
      set -ag status-right "#[fg=#{@thm_fg},bg=#{@thm_surface_1}] #(kubectl config current-context):#(kubectl config view --minify --output 'jsonpath={..namespace}')#[fg=#{@thm_surface_1}, bg=#{@thm_crust}]"
    '';
  };

  catppuccin.tmux.extraConfig = ''
    set -g @catppuccin_window_status_style "rounded"
  '';
}
