
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hiredis

LOCAL_CFLAGS := -O2  -D__ANDROID__

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables


SRC := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(SRC)
LOCAL_CFLAGS += -I$(SRC)

LOCAL_SRC_FILES += \
  $(SRC)/async.c $(SRC)/dict.c \
  $(SRC)/hiredis.c $(SRC)/net.c \
  $(SRC)/read.c $(SRC)/sds.c


# Allow to use the header files from external library.
# http://serenegiant.com/blog/?p=2119
LOCAL_EXPORT_C_INCLUDES := $(SRC)

include $(BUILD_STATIC_LIBRARY)
