cmd_/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o := gcc -Wp,-MD,/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/.avlpv.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/4.6/include -I/media/xyz/aosp/android-x86/kernel/arch/x86/include -Iarch/x86/include/generated/uapi -Iarch/x86/include/generated  -I/media/xyz/aosp/android-x86/kernel/include -Iinclude -I/media/xyz/aosp/android-x86/kernel/arch/x86/include/uapi -Iarch/x86/include/generated/uapi -I/media/xyz/aosp/android-x86/kernel/include/uapi -Iinclude/generated/uapi -include /media/xyz/aosp/android-x86/kernel/include/linux/kconfig.h   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-pic -m32 -msoft-float -mregparm=3 -freg-struct-return -mpreferred-stack-boundary=2 -march=i686 -mtune=pentium3 -mtune=generic -Wa,-mtune=generic32 -ffreestanding -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fno-delete-null-pointer-checks -Os -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -DCC_HAVE_ASM_GOTO -Wno-declaration-after-statement -include /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/VBox/VBoxGuestMangling.h   -I/media/xyz/aosp/android-x86/out/target/product/x86/obj/kernel/include   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/r0drv/linux   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/vboxguest/   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/vboxguest/include   -I/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/vboxguest/r0drv/linux -D__KERNEL__ -DMODULE -DVBOX -DRT_OS_LINUX -DIN_RING0 -DIN_RT_R0 -DIN_GUEST -DIN_GUEST_R0 -DIN_MODULE -DRT_WITH_VBOX -DVBGL_VBOXGUEST -DVBOX_WITH_HGCM -DRT_ARCH_X86  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(avlpv)"  -D"KBUILD_MODNAME=KBUILD_STR(vboxguest)" -c -o /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/.tmp_avlpv.o /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.c

source_/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o := /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.c

deps_/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o := \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/VBox/VBoxGuestMangling.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/mangling.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/avl.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/cdefs.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/types.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/stdint.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/stdarg.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.6/include/stdarg.h \
  /usr/lib/gcc/x86_64-linux-gnu/4.6/include/stddef.h \
  include/generated/uapi/linux/version.h \
  /media/xyz/aosp/android-x86/kernel/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/64bit.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /media/xyz/aosp/android-x86/kernel/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /media/xyz/aosp/android-x86/kernel/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /media/xyz/aosp/android-x86/kernel/include/uapi/linux/types.h \
  /media/xyz/aosp/android-x86/kernel/arch/x86/include/uapi/asm/types.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/asm-generic/types.h \
  /media/xyz/aosp/android-x86/kernel/include/asm-generic/int-ll64.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/asm-generic/int-ll64.h \
  /media/xyz/aosp/android-x86/kernel/arch/x86/include/uapi/asm/bitsperlong.h \
  /media/xyz/aosp/android-x86/kernel/include/asm-generic/bitsperlong.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/asm-generic/bitsperlong.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/linux/posix_types.h \
  /media/xyz/aosp/android-x86/kernel/include/linux/stddef.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/linux/stddef.h \
  /media/xyz/aosp/android-x86/kernel/arch/x86/include/asm/posix_types.h \
    $(wildcard include/config/x86/32.h) \
  /media/xyz/aosp/android-x86/kernel/arch/x86/include/uapi/asm/posix_types_32.h \
  /media/xyz/aosp/android-x86/kernel/include/uapi/asm-generic/posix_types.h \
  /media/xyz/aosp/android-x86/kernel/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/assert.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/include/iprt/err.h \
    $(wildcard include/config/size.h) \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_Base.cpp.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_Get.cpp.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_GetBestFit.cpp.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_RemoveBestFit.cpp.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_DoWithAll.cpp.h \
  /media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avl_Destroy.cpp.h \

/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o: $(deps_/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o)

$(deps_/media/xyz/aosp/android-6/device/generic/x86vbox/vboxguest-4.3.20/vboxguest/common/table/avlpv.o):
