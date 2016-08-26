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
PRODUCT_DEVICE := x86vbox
PRODUCT_BRAND := AOSP_x86vbox
PRODUCT_MODEL := Full_Android_x86vbox

TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := android-x86_defconfig
TARGET_ARCH := x86

PRODUCT_OUT ?= out/target/product/$(PRODUCT_DEVICE)

include $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# define build targets for kernel
.PHONY: $(TARGET_PREBUILT_KERNEL)

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

# Define this to use our own init.rc
# TARGET_PROVIDES_INIT_RC := true
#    device/generic/x86vbox/init.rc:root/init.rc \
    device/generic/x86vbox/init.x86vbox.rc:root/init.x86vbox.rc \
    device/generic/x86vbox/fstab.x86vbox:root/fstab.x86vbox \

# For android_filesystem_config.h, configure file permission in system folder
PRODUCT_PACKAGES += \
   fs_config_files

# define files to copy
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/generic/x86vbox/init.x86vbox.sh:system/etc/init.x86vbox.sh \
    device/generic/x86vbox/init.recovery.x86vbox.rc:root/init.recovery.x86vbox.rc \
    device/generic/x86vbox/init.recovery.x86vbox.sh:root/init.recovery.x86vbox.sh

# Integrated from android-x86
# Don't build emulator
BUILD_EMULATOR ?= false
BUILD_STANDALONE_EMULATOR ?= false
BUILD_EMULATOR_QEMUD ?= false
BUILD_EMULATOR_OPENGL ?= false
BUILD_EMULATOR_OPENGL_DRIVER ?= false
BUILD_EMULATOR_QEMU_PROPS ?= false
BUILD_EMULATOR_CAMERA_HAL ?= false
BUILD_EMULATOR_GPS_MODULE ?= false
BUILD_EMULATOR_LIGHTS_MODULE ?= false
BUILD_EMULATOR_SENSORS_MODULE ?= false

BUILD_ARM_FOR_X86 := $(WITH_NATIVE_BRIDGE)

BOARD_USE_LIBVA_INTEL_DRIVER := true
BOARD_USE_LIBVA := true
BOARD_USE_LIBMIX := true
BOARD_USES_WRS_OMXIL_CORE := true
USE_INTEL_OMX_COMPONENTS := true

USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS ?= 3
BOARD_USES_DRM_HWCOMPOSER ?= true

USE_CAMERA_STUB ?= false

# Get the hardware acceleration libraries
TARGET_HARDWARE_3D := true
BOARD_EGL_CFG ?= device/generic/common/gpu/egl_mesa.cfg
$(call inherit-product-if-exists,$(LOCAL_PATH)/gpu/gpu_mesa.mk)