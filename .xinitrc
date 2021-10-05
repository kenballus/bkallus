xset r rate 300 75
xbindkeys
xcompmgr -C &
feh --bg-fill ~/.background.jpg
clipmenud &

# Necessary for dwm to work with Swing apps
export _JAVA_AWT_WM_NONREPARENTING="1"

# For firefox to allow touch scrolling
export MOZ_USE_XINPUT2=1

# Make sure caps lock is off, then remap is to escape.
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

# Update the root window title, which shows in the top left in dwm
while true; do
    xsetroot -name "$(date +'%A, %B %d, %l:%M:%S')"
    sleep 1s
done &

# Rotate the Wacom inputs because the tablet is vertical
for devnum in $(xinput --list | grep 'Wacom' | sed --regexp-extended 's/.*id=([0-9]+).*/\1/g'); do
    xinput --set-prop $devnum 'Wacom Rotation' 2
done

# Coordinates of Dartmouth College
redshift -l 43.70241:-72.289339 &

exec dbus-launch dwm

