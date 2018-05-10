#!/bin/sh -x

# Take a screenshot
scrot /tmp/screen.png

# Pixellate it 10x
mogrify -scale 10% -scale 1000% /tmp/screen.png

# Lock screen displaying this image.
i3lock -i /tmp/screen.png

# Turn the screen off after a delay.
sleep 60; pgrep i3lock && xset dpms force off

