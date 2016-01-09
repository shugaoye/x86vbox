# Copyright (C) 2015 The Android Open Source Project
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
#******************************************************************************
#
# Makefile - Makefile of virtual device x86vbox
#
# Copyright (c) 2015 Roger Ye.  All rights reserved.
#
# This is part of the build for virtual device x86vbox.
#
#******************************************************************************

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_NAME := full_x86vbox
PRODUCT_DEVICE := x86
PRODUCT_BRAND := AOSP_x86vbox
PRODUCT_MODEL := Full_Android_x86vbox

TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := android-x86_defconfig
TARGET_ARCH := x86

PRODUCT_OUT ?= out/target/product/x86

include $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# define build targets for kernel
.PHONY: $(TARGET_PREBUILT_KERNEL)

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_COPY_FILES += \
     $(LOCAL_KERNEL):kernel \
     device/generic/x86vbox/fstab.x86:fstab.x86 \
     device/generic/x86vbox/init.x86.rc:root/init.x86.rc \
     device/generic/x86vbox/init.x86vbox.sh:system/etc/init.x86vbox.sh \
     device/generic/x86vbox/init.recovery.x86vbox.rc:root/init.recovery.x86vbox.rc \
     device/generic/x86vbox/init.recovery.x86vbox.sh:root/init.recovery.x86vbox.sh

