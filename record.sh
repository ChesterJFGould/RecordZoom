#! /bin/sh

# Open zoom in subshell
zoom &

# Wait for zoom to actually open, maybe find a better way to do this
sleep 3

# Focus the window
xdotool search Zoom | head -n 1 | xargs xdo activate

# Focus Join Button, press tab 10 times
# Could be a loop but since we know it's 10 times this is faster
xdotool key Tab Tab Tab Tab Tab Tab Tab Tab Tab Tab

# Press Space, this presses the Join button.
# Ideally we would press Enter here because that makes sense
# but for some reason the Enter keycodes aren't working and
# I don't want to spend time on that.
xdotool key space

# Wait for popup
sleep 1

# Press Tab twice to focus meeting id field.
xdotool key Tab Tab

# Enter room id passed in as first argument
xdotool type $1

# Select Join button
xdotool key Tab Tab Tab Tab Tab

# Press Join button
xdotool key space
