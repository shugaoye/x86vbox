#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86.mk)

# Overrides
PRODUCT_NAME := x86vbox
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86vbox
PRODUCT_MODEL := x86vbox_ch12

TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := android-x86_defconfig
TARGET_ARCH := x86

PRODUCT_OUT ?= out/target/product/$(PRODUCT_DEVICE)

include $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# define build targets for kernel
.PHONY: $(TARGET_PREBUILT_KERNEL)

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_PACKAGES += \
    mount.vboxsf \

PRODUCT_COPY_FILES += \
    device/generic/x86vbox/vbox/vboxguest.ko:system/vendor/vbox/vboxguest.ko \
    device/generic/x86vbox/vbox/vboxsf.ko:system/vendor/vbox/vboxsf.ko \
    device/generic/x86vbox/vbox/vboxvideo.ko:system/vendor/vbox/vboxvideo.ko \
    device/generic/x86vbox/recovery.fstab:recovery/root/etc/recovery.fstab \
    device/generic/x86vbox/recovery/root/init.recovery.x86vbox.rc:root/init.recovery.x86vbox.rc \
    device/generic/x86vbox/recovery/root/sbin/network_start.sh:recovery/root/sbin/network_start.sh \
    device/generic/x86vbox/recovery/root/sbin/create_partitions.sh:recovery/root/sbin/create_partitions.sh \
    $(LOCAL_KERNEL):kernel \
