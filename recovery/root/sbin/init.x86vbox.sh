#!/bin/busybox sh 

echo -n "Running /vendor/etc/init.sh"
PATH=/bin:/sbin:/bin; export PATH
# source /vendor/etc/dev2mod
# cat /sys/bus/*/devices/*/uevent | grep MODALIAS | sed 's/^MODALIAS=//' | /bin/sort -u | dev2mod
cd /bin;busybox --install -s
cd /x86vbox
insmod atkbd.ko
insmod cn.ko
insmod uvesafb.ko mode_option=${UVESA_MODE:-1024x768}-$bpp ${UVESA_OPTION:-mtrr=3 scroll=redraw}
