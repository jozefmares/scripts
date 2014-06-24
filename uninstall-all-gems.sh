for i in $(gem q -l | awk '{ print $1 }'); do gem uninstall $i;done
