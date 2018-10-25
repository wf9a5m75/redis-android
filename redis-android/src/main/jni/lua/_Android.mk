
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := lua
LOCAL_CFLAGS := -O2  -D__ANDROID__

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables


SRC := $(LOCAL_PATH)/src
LOCAL_C_INCLUDES += $(SRC)
LOCAL_CFLAGS += -I$(SRC)

LOCAL_SRC_FILES += \
  $(SRC)/fpconv.c $(SRC)/lapi.c $(SRC)/lauxlib.c $(SRC)/lbaselib.c $(SRC)/lcode.c \
  $(SRC)/ldblib.c $(SRC)/ldebug.c $(SRC)/ldo.c \
  $(SRC)/ldump.c $(SRC)/lfunc.c $(SRC)/lgc.c $(SRC)/linit.c $(SRC)/liolib.c \
  $(SRC)/llex.c $(SRC)/lmathlib.c $(SRC)/lmem.c $(SRC)/loadlib.c \
  $(SRC)/lobject.c $(SRC)/lopcodes.c $(SRC)/loslib.c $(SRC)/lparser.c \
  $(SRC)/lstate.c $(SRC)/lstring.c $(SRC)/lstrlib.c $(SRC)/ltable.c $(SRC)/ltablib.c \
  $(SRC)/ltm.c $(SRC)/lua.c $(SRC)/lua_bit.c $(SRC)/lua_cjson.c \
  $(SRC)/lua_cmsgpack.c $(SRC)/lua_struct.c $(SRC)/luac.c $(SRC)/lundump.c $(SRC)/lvm.c \
  $(SRC)/lzio.c $(SRC)/print.c $(SRC)/strbuf.c


# Allow to use the header files from external library.
# http://serenegiant.com/blog/?p=2119
LOCAL_EXPORT_C_INCLUDES := $(SRC)

include $(BUILD_STATIC_LIBRARY)
