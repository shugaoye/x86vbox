LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= mount.vboxsf.c

LOCAL_CFLAGS:=-O2 -g
#LOCAL_CFLAGS+=-DLINUX

LOCAL_MODULE:=mount.vboxsf
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
