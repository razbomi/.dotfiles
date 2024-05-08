show_kube() {
  local index=$1
  local icon="$(get_tmux_option "@catppuccin_test_icon" "󱃾")"
  local color="$(get_tmux_option "@catppuccin_test_color" "$thm_blue")"
  local text="$(get_tmux_option "@catppuccin_test_text" "#(kubectl config current-context):#(kubectl config view --minify --output 'jsonpath={..namespace}')")"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
