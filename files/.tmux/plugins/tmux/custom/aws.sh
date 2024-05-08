show_aws() {

  local index=$1
  local icon="$(get_tmux_option "@catppuccin_test_icon" "󰸏")"
  local color="$(get_tmux_option "@catppuccin_test_color" "$thm_orange")"
  local text="$(get_tmux_option "@catppuccin_test_text" "#( cat ~/.aws_current_profile )")"

  local module=$(build_status_module "$index" "$icon" "$color" "$text")

  echo "${module}"
}
