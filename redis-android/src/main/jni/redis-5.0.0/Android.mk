ORG_LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles)

LOCAL_PATH := $(ORG_LOCAL_PATH)
SRC := $(LOCAL_PATH)/src

# for debug
#$(warning "-------------------")
#$(warning $(LOCAL_PATH))
#$(warning "-------------------")


include $(CLEAR_VARS)

# Generate release.c/release.h files
RELEASE_HDR := $(shell sh -c '$(SRC)/mkreleasehdr.sh')

LOCAL_MODULE    := redis

REDIS_ANDROID := redis-android
REDIS_DIR := redis-5.0.0

LOCAL_LDLIBS := -llog
LOCAL_CFLAGS := -O3  -D__ANDROID__ -D__REDIS_ANDROID__

# Redis default settings
STD :=-std=c99 -pedantic -DREDIS_STATIC=''
WARN := -W -Wno-missing-field-initializers
LOCAL_CFLAGS += $(STD) $(WARN)

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables


# Jni entry point
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../
LOCAL_SRC_FILES += $(LOCAL_PATH)/../redis-android.c

HAVE_EVPORT := 0
HAVE_EPOLL := 0
HAVE_KQUEUE := 1

# Includes bthread library
LOCAL_STATIC_LIBRARIES += bthread

# Includes hiredis library
LOCAL_STATIC_LIBRARIES += hiredis

# Includes lua library
LOCAL_STATIC_LIBRARIES += lua

# Includes linenoise library
LOCAL_STATIC_LIBRARIES += linenoise

# Includes jemalloc library
# LOCAL_STATIC_LIBRARIES += jemalloc


ifeq ($(REDIS_DIR),redis-5.0.0)

  LOCAL_SRC_FILES += \
    $(SRC)/adlist.c $(SRC)/ae.c \
    $(SRC)/anet.c $(SRC)/aof.c $(SRC)/bio.c \
    $(SRC)/bitops.c $(SRC)/blocked.c $(SRC)/childinfo.c \
    $(SRC)/cluster.c \
    $(SRC)/config.c $(SRC)/crc16.c $(SRC)/crc64.c \
    $(SRC)/db.c $(SRC)/debug.c $(SRC)/defrag.c  \
    $(SRC)/dict.c $(SRC)/endianconv.c $(SRC)/evict.c \
    $(SRC)/expire.c $(SRC)/geo.c $(SRC)/geohash.c $(SRC)/geohash_helper.c \
    $(SRC)/hyperloglog.c $(SRC)/intset.c $(SRC)/latency.c \
    $(SRC)/lazyfree.c $(SRC)/listpack.c $(SRC)/localtime.c $(SRC)/lolwut.c \
    $(SRC)/lolwut5.c  \
    $(SRC)/lzf_c.c $(SRC)/lzf_d.c  $(SRC)/memtest.c \
    $(SRC)/module.c $(SRC)/multi.c $(SRC)/networking.c $(SRC)/notify.c \
    $(SRC)/object.c $(SRC)/pqsort.c $(SRC)/pubsub.c \
    $(SRC)/quicklist.c $(SRC)/rand.c $(SRC)/rax.c $(SRC)/rdb.c \
    $(SRC)/release.c $(SRC)/replication.c $(SRC)/rio.c \
    $(SRC)/scripting.c $(SRC)/sds.c $(SRC)/sentinel.c \
    $(SRC)/server.c $(SRC)/setproctitle.c $(SRC)/sha1.c \
    $(SRC)/siphash.c $(SRC)/slowlog.c $(SRC)/sort.c $(SRC)/sparkline.c \
    $(SRC)/syncio.c $(SRC)/t_hash.c $(SRC)/t_list.c \
    $(SRC)/t_set.c $(SRC)/t_stream.c $(SRC)/t_string.c $(SRC)/t_zset.c \
    $(SRC)/util.c $(SRC)/wait3.c $(SRC)/ziplist.c \
    $(SRC)/zipmap.c $(SRC)/zmalloc.c $(SRC)/redis-check-aof.c \
    $(SRC)/redis-check-rdb.c

endif

include $(BUILD_SHARED_LIBRARY)

#------------------
# redis-check-rdb
#------------------
include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE    := redis-check-rdb

HAVE_EVPORT := 0
HAVE_EPOLL := 0
HAVE_KQUEUE := 0

REDIS_ANDROID_DIR := redis-5.0.0
REDIS_DIR := redis-5.0.0

# Includes lua library
LOCAL_STATIC_LIBRARIES += lua

# Includes bthread library
LOCAL_STATIC_LIBRARIES += bthread

# Includes hiredis library
LOCAL_STATIC_LIBRARIES += hiredis

# Includes linenoise library
LOCAL_STATIC_LIBRARIES += linenoise

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS := -O3  -D__ANDROID__ -D__REDIS_ANDROID__

# Redis default settings
STD :=-std=c99 -pedantic -DREDIS_STATIC=''
WARN := -W -Wno-missing-field-initializers
LOCAL_CFLAGS += $(STD) $(WARN)

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../

ifeq ($(REDIS_DIR),redis-5.0.0)

  LOCAL_SRC_FILES += \
    $(SRC)/adlist.c $(SRC)/ae.c  \
    $(SRC)/anet.c $(SRC)/aof.c $(SRC)/bio.c \
    $(SRC)/bitops.c $(SRC)/blocked.c $(SRC)/childinfo.c \
    $(SRC)/cluster.c \
    $(SRC)/config.c $(SRC)/crc16.c $(SRC)/crc64.c \
    $(SRC)/db.c $(SRC)/debug.c $(SRC)/defrag.c  \
    $(SRC)/dict.c $(SRC)/endianconv.c $(SRC)/evict.c \
    $(SRC)/expire.c $(SRC)/geo.c $(SRC)/geohash.c $(SRC)/geohash_helper.c \
    $(SRC)/hyperloglog.c $(SRC)/intset.c $(SRC)/latency.c \
    $(SRC)/lazyfree.c $(SRC)/lzf_c.c $(SRC)/lzf_d.c  $(SRC)/memtest.c \
    $(SRC)/module.c $(SRC)/multi.c $(SRC)/networking.c $(SRC)/notify.c \
    $(SRC)/object.c $(SRC)/pqsort.c $(SRC)/pubsub.c \
    $(SRC)/quicklist.c $(SRC)/rand.c $(SRC)/rax.c $(SRC)/rdb.c \
    $(SRC)/release.c $(SRC)/replication.c $(SRC)/rio.c \
    $(SRC)/scripting.c $(SRC)/sentinel.c \
    $(SRC)/server.c $(SRC)/setproctitle.c $(SRC)/sha1.c \
    $(SRC)/siphash.c $(SRC)/slowlog.c $(SRC)/sort.c $(SRC)/sparkline.c \
    $(SRC)/syncio.c $(SRC)/t_hash.c $(SRC)/t_list.c \
    $(SRC)/t_set.c $(SRC)/t_string.c $(SRC)/t_zset.c \
    $(SRC)/util.c $(SRC)/wait3.c $(SRC)/ziplist.c \
    $(SRC)/zipmap.c $(SRC)/zmalloc.c $(SRC)/redis-check-aof.c \
    $(SRC)/redis-check-rdb.c

endif

include $(BUILD_EXECUTABLE)

#------------------
# redis-check-aof
#------------------
include $(CLEAR_VARS)
LOCAL_MODULE    := redis-check-aof

REDIS_ANDROID_DIR := redis-5.0.0
REDIS_DIR := redis-5.0.0

# Includes lua library
LOCAL_STATIC_LIBRARIES += lua

# Includes bthread library
LOCAL_STATIC_LIBRARIES += bthread

# Includes hiredis library
LOCAL_STATIC_LIBRARIES += hiredis

# Includes linenoise library
LOCAL_STATIC_LIBRARIES += linenoise

LOCAL_LDLIBS += -llog
LOCAL_CFLAGS += -O3  -D__ANDROID__

# Redis default settings
STD :=-std=c99 -pedantic -DREDIS_STATIC=''
WARN := -W -Wno-missing-field-initializers
LOCAL_CFLAGS += $(STD) $(WARN)

# To get ARM stack traces if Redis crashes we need a special C flag.
LOCAL_CFLAGS += -funwind-tables

LOCAL_C_INCLUDES += $(LOCAL_PATH)/../

ifeq ($(REDIS_DIR),redis-5.0.0)


  LOCAL_SRC_FILES += \
    $(SRC)/adlist.c $(SRC)/ae.c  \
    $(SRC)/anet.c $(SRC)/aof.c $(SRC)/bio.c \
    $(SRC)/bitops.c $(SRC)/blocked.c $(SRC)/childinfo.c \
    $(SRC)/cluster.c \
    $(SRC)/config.c $(SRC)/crc16.c $(SRC)/crc64.c \
    $(SRC)/db.c $(SRC)/debug.c $(SRC)/defrag.c  \
    $(SRC)/dict.c $(SRC)/endianconv.c $(SRC)/evict.c \
    $(SRC)/expire.c $(SRC)/geo.c $(SRC)/geohash.c $(SRC)/geohash_helper.c \
    $(SRC)/hyperloglog.c $(SRC)/intset.c $(SRC)/latency.c \
    $(SRC)/lazyfree.c $(SRC)/lzf_c.c $(SRC)/lzf_d.c  $(SRC)/memtest.c \
    $(SRC)/module.c $(SRC)/multi.c $(SRC)/networking.c $(SRC)/notify.c \
    $(SRC)/object.c $(SRC)/pqsort.c $(SRC)/pubsub.c \
    $(SRC)/quicklist.c $(SRC)/rand.c $(SRC)/rax.c $(SRC)/rdb.c \
    $(SRC)/release.c $(SRC)/replication.c $(SRC)/rio.c \
    $(SRC)/scripting.c $(SRC)/sentinel.c \
    $(SRC)/server.c $(SRC)/setproctitle.c $(SRC)/sha1.c \
    $(SRC)/siphash.c $(SRC)/slowlog.c $(SRC)/sort.c $(SRC)/sparkline.c \
    $(SRC)/syncio.c $(SRC)/t_hash.c $(SRC)/t_list.c \
    $(SRC)/t_set.c $(SRC)/t_string.c $(SRC)/t_zset.c \
    $(SRC)/lolwut.c $(SRC)/lolwut5.c $(SRC)/localtime.c \
    $(SRC)/listpack.c $(SRC)/t_stream.c \
    $(SRC)/util.c $(SRC)/wait3.c $(SRC)/ziplist.c \
    $(SRC)/zipmap.c $(SRC)/zmalloc.c $(SRC)/redis-check-aof.c \
    $(SRC)/redis-check-rdb.c

endif

include $(BUILD_EXECUTABLE)

#------------------
# redis-cli
#------------------
include $(CLEAR_VARS)
LOCAL_MODULE    := redis-cli

REDIS_ANDROID_DIR := redis-5.0.0
REDIS_DIR := redis-5.0.0


# Includes linenoise library
LOCAL_STATIC_LIBRARIES += linenoise

# Includes hiredis library
LOCAL_STATIC_LIBRARIES += hiredis

# Includes lua library
LOCAL_STATIC_LIBRARIES += lua

LOCAL_LDLIBS := -llog
LOCAL_CFLAGS := -O3  -D__ANDROID__

LOCAL_SRC_FILES += \
  $(SRC)/anet.c $(SRC)/adlist.c  \
  $(SRC)/redis-cli.c $(SRC)/zmalloc.c  \
  $(SRC)/release.c $(SRC)/crc64.c  \
  $(SRC)/ae.c $(SRC)/crc16.c $(SRC)/dict.c $(SRC)/siphash.c

#### PROJECT_PATH := $(abspath $(SOURCE_PATH)/../../)
#### TARGET_OUT := $(PROJECT_PATH)/res/raw/
#### $(warning $(TARGET_OUT))

include $(BUILD_EXECUTABLE)
