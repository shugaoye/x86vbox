The current build is based on vboxguest-4.3.20 and kernel-3.18.8.

Build kernel module:
$ make BUILD_TARGET_ARCH=x86 KERN_DIR=$OUT/obj/KERNEL_OBJ

Mount a shared folder using the below command:
# system/bin/mount.vboxsf x86vbox /android/mnt
