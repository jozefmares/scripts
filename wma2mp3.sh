#!/usr/bin/env bash

for i in *.wma ; do /usr/bin/mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader "$i" && /usr/bin/lame -m j -h --vbr-new -b 160 audiodump.wav -o "`basename "$i" .wma`.mp3"; done; rm -f audiodump.wav
