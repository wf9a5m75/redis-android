
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := jemalloc
LOCAL_CFLAGS := -O2  -D__ANDROID__

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables


SRC := $(LOCAL_PATH)/src
INCLUDE := $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(SRC)
LOCAL_C_INCLUDES += $(INCLUDE)
LOCAL_CFLAGS += -I$(SRC) -I$(INCLUDE)

LOCAL_SRC_FILES += \
  $(SRC)/arena.c $(SRC)/atomic.c $(SRC)/background_thread.c $(SRC)/base.c $(SRC)/bin.c \
  $(SRC)/bitmap.c $(SRC)/chunk.c $(SRC)/chunk_dss.c $(SRC)/chunk_mmap.c \
  $(SRC)/ckh.c $(SRC)/ctl.c $(SRC)/div.c $(SRC)/extent.c $(SRC)/extent_dss.c \
  $(SRC)/extent_mmap.c $(SRC)/hash.c $(SRC)/hook.c $(SRC)/huge.c \
  $(SRC)/jemalloc.c $(SRC)/jemalloc_cpp.c $(SRC)/large.c $(SRC)/log.c \
  $(SRC)/malloc_io.c $(SRC)/mb.c $(SRC)/mutex.c $(SRC)/mutex_pool.c $(SRC)/nstime.c \
  $(SRC)/pages.c $(SRC)/prng.c $(SRC)/prof.c $(SRC)/quarantine.c \
  $(SRC)/tree.c $(SRC)/stats.c $(SRC)/sz.c $(SRC)/tcache.c $(SRC)/ticker.c \
  $(SRC)/tsd.c $(SRC)/util.c $(SRC)/valgrind.c $(SRC)/witness.c $(SRC)/zone.c


# Allow to use the header files from external library.
# http://serenegiant.com/blog/?p=2119
LOCAL_EXPORT_C_INCLUDES := $(SRC) $(INCLUDE)

include $(BUILD_STATIC_LIBRARY)
