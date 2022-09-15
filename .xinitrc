xset r rate 300 75

# Make sure caps lock is off, then remap is to escape.
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'
xmodmap -e 'keysym Menu = Super_R'


exec dbus-launch dwm

