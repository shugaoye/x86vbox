#!/system/bin/sh

# <-- init.goldfish.sh --

# Setup networking when boot starts
ifconfig eth0 10.0.2.15 netmask 255.255.255.0 up
route add default gw 10.0.2.2 dev eth0

ifconfig eth1 192.168.56.51 netmask 255.255.255.0 up

# ro.kernel.android.qemud is normally set when we
# want the RIL (radio interface layer) to talk to
# the emulated modem through qemud.
#
# However, this will be undefined in two cases:
#
# - When we want the RIL to talk directly to a guest
#   serial device that is connected to a host serial
#   device by the emulator.
#
# - We don't want to use the RIL but the VM-based
#   modem emulation that runs inside the guest system
#   instead.
#
# The following detects the latter case and sets up the
# system for it.
#
qemud=`getprop ro.kernel.android.qemud`
case "$qemud" in
    "")
    radio_ril=`getprop ro.kernel.android.ril`
    case "$radio_ril" in
        "")
        # no need for the radio interface daemon
        # telephony is entirely emulated in Java
        setprop ro.radio.noril yes
        stop ril-daemon
        ;;
    esac
    ;;
esac

# Setup additionnal DNS servers if needed
num_dns=`getprop ro.kernel.ndns`
case "$num_dns" in
    2) setprop net.eth0.dns2 10.0.2.4
       ;;
    3) setprop net.eth0.dns2 10.0.2.4
       setprop net.eth0.dns3 10.0.2.5
       ;;
    4) setprop net.eth0.dns2 10.0.2.4
       setprop net.eth0.dns3 10.0.2.5
       setprop net.eth0.dns4 10.0.2.6
       ;;
esac

# disable boot animation for a faster boot sequence when needed
boot_anim=`getprop ro.kernel.android.bootanim`
case "$boot_anim" in
    0)  setprop debug.sf.nobootanimation 1
    ;;
esac

# set up the second interface (for inter-emulator connections)
# if required
my_ip=`getprop net.shared_net_ip`
case "$my_ip" in
    "")
    ;;
    *) ifconfig eth1 "$my_ip" netmask 255.255.255.0 up
    ;;
esac
# -- init.goldfish.sh -->

unset LD_PRELOAD

vbox_graph_mode="800x600-16"
vbox_dpi="160"
vbox_sdcard_drive="/dev/block/sda2"

# Disable cursor blinking - Thanks android-x86 :-)
echo -e '\033[?17;0;0c' > /dev/tty0

# SDCARD
# if [ -b $vbox_sdcard_drive ]; then
#   echo "Trying to mount $vbox_sdcard_drive" > /dev/ttyS3
#   mount -t vfat -o fmask=0000,dmask=0000 $vbox_sdcard_drive /storage/sdcard
#   if [ $? -ne 0 ]; then
#     echo "Unable to mount $vbox_sdcard_drive, try to create FAT" > /dev/ttyS3
#     newfs_msdos $vbox_sdcard_drive
#     mount -t vfat -o fmask=0000,dmask=0000 $vbox_sdcard_drive /storage/sdcard
#     if [ $? -ne 0 ]; then
#       echo "Unable to create FAT" > /dev/ttyS3
#     fi
#   fi
# else 
#   echo "NO SDCARD" > /dev/ttyS3
# fi

# prop_hardware_opengl=`/system/bin/androVM-prop get hardware_opengl`
# Starting eth0 management
# First check if eth0 is 'plugged'
# if [ $prop_hardware_opengl ]; then
#   /system/bin/netcfg eth0 up
#   CARRIER=`cat /sys/class/net/eth0/carrier`
#   if [ $CARRIER -eq 1 ]; then
#     /system/bin/netcfg eth0 dhcp
#     IPETH0=(`ifconfig eth0`)
#     IPMGMT=${IPETH0[2]}
#     /system/bin/androVM-prop set androvm_ip_management $IPMGMT
#     echo "IP Management : $IPMGMT" > /dev/ttyS3
#   else
#     /system/bin/androVM-prop set androvm_ip_management 0.0.0.0
#     echo "eth0 interface is not connected" > /dev/ttyS3
#   fi
# else
#   (
#     /system/bin/netcfg eth0 dhcp
#     IPETH0=(`ifconfig eth0`)
#     IPMGMT=${IPETH0[2]}
#     /system/bin/androVM-prop set androvm_ip_management $IPMGMT
#     echo "IP Management : $IPMGMT" > /dev/ttyS3 
#   )&
# fi

# Load parameters from virtualbox guest properties
chown system /dev/vboxguest
prop_vbox_graph_mode=`/system/bin/androVM-prop get vbox_graph_mode`
if [ $prop_vbox_graph_mode ]; then
  vbox_graph_mode=$prop_vbox_graph_mode
  setprop androVM.vbox_graph_mode $prop_vbox_graph_mode
fi

prop_vbox_dpi=`/system/bin/androVM-prop get vbox_dpi`
if [ $prop_vbox_dpi ]; then
  vbox_dpi=$prop_vbox_dpi
  setprop androVM.vbox_dpi $prop_vbox_dpi
fi

prop_vbox_sdcard_drive=`/system/bin/androVM-prop get vbox_sdcard_drive`
if [ $prop_vbox_sdcard_drive ]; then
  vbox_sdcard_drive=$prop_vbox_sdcard_drive
  setprop androVM.vbox_sdcard_drive $prop_vbox_sdcard_drive
fi

prop_keyboard_disable=`/system/bin/androVM-prop get keyboard_disable`
if [ $prop_keyboard_disable ]; then
  keyboard_disable=$prop_keyboard_disable
  setprop androVM.keyboard_disable $prop_keyboard_disable
fi

prop_statusbar_present=`/system/bin/androVM-prop get statusbar_present`
if [ $prop_statusbar_present ]; then
  setprop qemu.hw.mainkeys 0
fi 

prop_su_bypass=`/system/bin/androVM-prop get su_bypass`
if [ $prop_su_bypass ]; then
  setprop androVM.su.bypass 1
fi 

# UVESAFB
# insmod /system/lib/cfbcopyarea.ko
# insmod /system/lib/cfbfillrect.ko
# insmod /system/lib/cfbimgblt.ko
# insmod /system/lib/uvesafb.ko mode_option=$vbox_graph_mode scroll=redraw

# if [ $prop_hardware_opengl ]; then
#   if [ $IPMGMT ]; then
#     setprop androVM.gles 1
#     prop_hardware_opengl_disable_render=`/system/bin/androVM-prop get hardware_opengl_disable_render`
#     if [ ! $prop_hardware_opengl_disable_render ]; then
#       setprop androVM.gles.renderer 1
#     fi
#   else
#     echo "eth0 is not configured correctly - HARDWARE OPENGL IS DISABLED !!!"  > /dev/ttyS3
#     setprop ro.sf.lcd_density $vbox_dpi
#     sleep 10
#   fi
# else
#   setprop ro.sf.lcd_density $vbox_dpi
# fi

setprop ro.sf.lcd_density $vbox_dpi
setprop ro.product.cpu.abi x86
setprop ro.product.cpu.abilist32 x86

# ARM ABI
abi2_set=`getprop ro.product.cpu.abi2`
if [ ! $abi2_set ]; then
  if [ -f /system/lib/libhoudini.so ]; then
    setprop ro.product.cpu.abi2 armeabi-v7a
  fi
fi
abi3_set=`getprop ro.product.cpu.abi3`
if [ ! $abi3_set ]; then
  if [ -f /system/lib/libhoudini.so ]; then
    setprop ro.product.cpu.abi3 armeabi
  fi
fi

setprop androVM.inited 1
