xset r rate 300 75                              # Key repeat rate
xbindkeys                                       # Read key bindings from .xbindkeysrc
xcompmgr -C &                                   # Enable transparency
feh --bg-fill ~/.background.jpg                 # wm background
clipmenud &                                     # clipboard manager

export _JAVA_AWT_WM_NONREPARENTING="1"          # Fixes some java apps that don't work with dwm

xmodmap -e 'clear Lock'                         # Ensures you're not stuck in caps lock mode
xmodmap -e 'keycode 0x42=Escape'                # Remaps caps lock to escape

MOTD="$(python3 .generate_motd.py)"             # message in menu bar
while true; do                                  # Clock in dwm status bar
    xsetroot -name "$MOTD  $(date +'%A, %B %d, %l:%M:%S')"
    sleep 1s
done &

WACOM_DISPLAY="DVI-I-1"

for dev in $(xinput --list | grep Wacom | sed --regexp-extended 's/.*id=([0-9]+).*/\1/g'); do
    xinput --map-to-output $dev $WACOM_DISPLAY
done

exec dbus-launch dwm                            # dbus-launch is necessary for flameshot

