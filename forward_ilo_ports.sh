#!/usr/bin/env bash

# $1 is target IP, $2 where is forwarding gateway (router).
# this script expects to be executed via sudo as it forwards privileged ports.

echo "Put as firsh argument target IP (ILO IP) and as second user and gateway machine (router)"
sudo ssh -L 22:$1:22 -L 23:$1:23 -L 80:$1:80 -L 443:$1:443 -L 17988:$1:17988 -L 9300:$1:9300 -L 17990:$1:17990 -L 3002:$1:3002 $2
