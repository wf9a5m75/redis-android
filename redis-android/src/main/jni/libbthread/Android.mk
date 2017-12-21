LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
SOURCE_PATH := $(abspath $(call my-dir))

LOCAL_SRC_FILES:=\
	pt-cancel.c\
	pt-docancel.c\
	pt-setcancelstate.c\
	pt-setcanceltype.c\
	pt-testcancel.c\
	pt-init.c

LOCAL_C_INCLUDES:=libbthread/
	
LOCAL_CFLAGS:= -ffunction-sections -fdata-sections

LOCAL_MODULE:= libbthread

# Allow to use the header files from external library.
# http://serenegiant.com/blog/?p=2119
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)

