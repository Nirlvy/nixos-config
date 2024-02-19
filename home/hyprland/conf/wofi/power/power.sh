#!/bin/bash


CFG="$HOME/.config/wofi/power/config"
STYLE="$HOME/.config/wofi/style.css"


power() {
  # Store the wofi command in a variable for convenience
  WOFI="wofi -c "$CFG" -s "$STYLE" --show dmenu"

  # List the options that the user can choose from
  OPTIONS="          锁屏
          注销
          休眠
          重启
          关机"

  # Display the options using wofi
  SELECTED=$(echo "$OPTIONS" | $WOFI)

  # Check which option was selected and run the corresponding command
  case "$SELECTED" in
    "          锁屏")
      swaylock &
      ;;
    "          注销")
      hyprctl dispatch exit 1
      ;;
    "          休眠")
      systemctl suspend
      ;;
    "          重启")
      systemctl reboot
      ;;
    "          关机")
      poweroff
      ;;
  esac
}



if [[ -z "$(pidof wofi)" ]];then
  power
else
  killall wofi
fi

