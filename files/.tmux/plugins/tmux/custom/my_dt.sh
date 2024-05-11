show_my_dt() {
  local index icon color text module

  index=$1
  icon="$(get_tmux_option "@catppuccin_my_dt_icon" "")"
  color="$(get_tmux_option "@catppuccin_my_dt_color" "$thm_gray")"
  text="$(get_tmux_option "@catppuccin_my_dt_text" "#[fg=$thm_black,bg=$thm_gray]#(date +'%a, %d %b %H:%M')")"

  module=$(build_status_module "$index" "$icon" "$color" "$text")
  echo "${module}"
}
