# vbox86
VirtualBox device configuration for AOSP build.

$ repo init -u https://android.googlesource.com/platform/manifest -b android-6.0.1_r10
$ repo sync
$ . build/envsetup.sh
$ lunch full_x86vbox-eng
$ make -j4

201060106 - Builde with AOSP android-6.0.1_r10
