#!/usr/bin/env bash

sleep 2 

xrandr | grep VGA | grep " connected "
if [ $? -eq 0 ]; then
  # External monitor is connected
  xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --output LVDS1 --mode 1024x768
  if [ $? -ne 0 ]; then
    # Something went wrong. Autoconfigure the internal monitor and disable the external one
    xrandr --output LVDS1 --mode auto --output VGA1 --off
  fi
else
  # External monitor is not connected
  xrandr --output LVDS1 --mode 1024x768 --output VGA1 --off
fi

