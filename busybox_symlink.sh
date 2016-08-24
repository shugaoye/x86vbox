#!/system/bin/sh

# Public Domain

for b in $(/system/xbin/busybox --list); do
  ln -s /system/xbin/busybox "./${b}"
done
