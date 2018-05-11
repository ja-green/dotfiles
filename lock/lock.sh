#!/bin/bash

lockbg="/tmp/lockbg.png"

rm -f ${lockbg} && scrot ${lockbg}

# betterlockscreen -u ${lockbg} -b 2

# betterlockscreen --lock

convert -scale 10% -blur 0x2.0 -resize 1000% ${lockbg} ${lockbg}

letter_entered=8ba870ff
letter_removed=966575ff
pw_corr=8ba870ff
pw_incorr=966575ff
background=404552ff
foreground=dadadaff

i3lock \
  -t -i "${lockbg}" \
  --timepos="110:h-70" \
  --datepos="135:h-45" \
  --clock --datestr "Type password to unlock..." \
  --insidecolor=$background --ringcolor=$foreground --line-uses-inside \
  --keyhlcolor=$letter_entered --bshlcolor=$letter_removed --separatorcolor=$background \
  --insidevercolor=$pw_corr --insidewrongcolor=$pw_incorr \
  --ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
  --radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
  --verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
  --noinputtext="" --force-clock $lockargs

