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
    xsetroot -name "$MOTD  $(date +'%A, %B %d, %l:%M:%S')"
    sleep 1s
done &

WACOM_DISPLAY="DVI-I-1"

for dev in $(xinput --list | grep Wacom | sed --regexp-extended 's/.*id=([0-9]+).*/\1/g'); do
    xinput --map-to-output $dev $WACOM_DISPLAY
done

exec dbus-launch dwm

