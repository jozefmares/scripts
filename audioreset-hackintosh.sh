#!/usr/bin/env bash
sudo kextunload /System/Library/Extensions/AppleHDA.kext
sudo kextload /System/Library/Extensions/AppleHDA.kext
sudo killall coreaudiod
echo "Done, lower audio."
