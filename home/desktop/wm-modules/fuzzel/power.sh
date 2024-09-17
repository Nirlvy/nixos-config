#! /usr/bin/env bash

power() {
  FUZZEL="fuzzel -d"

  OPTIONS="锁屏
注销
休眠
重启
关机"

  SELECTED=$(echo "$OPTIONS" | $FUZZEL)

  # Check which option was selected and run the corresponding command
  case "$SELECTED" in
    "锁屏")
      hyprlock &
      ;;
    "注销")
      logout
      ;;
    "休眠")
      systemctl suspend
      ;;
    "重启")
      systemctl reboot
      ;;
    "关机")
      poweroff
      ;;
  esac
}



if [[ -z "$(pidof fuzzel)" ]];then
  power
else
  killall fuzzel
fi

