LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
SOURCE_PATH := $(abspath $(call my-dir))

LOCAL_SRC_FILES:= linenoise.c

LOCAL_C_INCLUDES:=linenoise/

LOCAL_MODULE:= liblinenoise

# Allow to use the header files from external library.
# http://serenegiant.com/blog/?p=2119
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)

