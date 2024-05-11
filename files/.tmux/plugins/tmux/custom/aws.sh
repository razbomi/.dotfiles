show_aws() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_aws_icon" "󰸏")"
  color="$(get_tmux_option "@catppuccin_aws_color" "$thm_orange")"
  text="$(get_tmux_option "@catppuccin_aws_text" "#[fg=$thm_orange]#( cut -f 1 -d \" \" ~/.aws_current_profile ) #[fg=$thm_yellow]#( cut -f 2 -d \" \" ~/.aws_current_profile )")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")
  echo "${module}"
}
