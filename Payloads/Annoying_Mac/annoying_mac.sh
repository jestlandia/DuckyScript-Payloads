#!/bin/bash

WIFI_INTERFACE="en0"

move_mouse() {
  x=$1
  y=$2
  osascript -l JavaScript <<EOF
  ObjC.import('Cocoa');
  ObjC.import('CoreGraphics');
  $.CGWarpMouseCursorPosition($.CGPointMake($x, $y));
EOF
}

while true
do

    networksetup -setairportpower "$WIFI_INTERFACE" off

    move_mouse 300 0
    sleep 2
    move_mouse 2000 200
    sleep 2

    networksetup -setairportpower "$WIFI_INTERFACE" on

    move_mouse 25 100
    sleep 2
    move_mouse 1000 1000
    sleep 2
done
