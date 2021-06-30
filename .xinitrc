xset r rate 300 75
xbindkeys
xcompmgr -C &
feh --bg-fill ~/.background.jpg
clipmenud &

export _JAVA_AWT_WM_NONREPARENTING="1"

xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

MOTD="$(python3 .generate_motd.py)"
while true; do
    xsetroot -name "$MOTD  $(date +'%A, %B %d, %l:%M:%S'); $(cat /sys/class/power_supply/BAT0/capacity)%"
    sleep 1s
done &

exec dbus-launch dwm

