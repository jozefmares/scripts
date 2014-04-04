#!/usr/bin/env bash
while true; do date| tr -d '\n' && echo  -  |tr -d '\n'; nmap $1 -p 22 -PN |grep 22/tcp; sleep 30; done
