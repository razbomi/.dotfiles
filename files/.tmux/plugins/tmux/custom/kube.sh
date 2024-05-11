show_kube() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_kube_icon" "󱃾")"
  color="$(get_tmux_option "@catppuccin_kube_color" "$thm_blue")"
  text="$(get_tmux_option "@catppuccin_kube_text" "#[fg=$thm_blue]#(kubectl config current-context) #[fg=$thm_cyan]#(kubectl config view --minify --output 'jsonpath={..namespace}')")"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )
  echo "$module"
}
