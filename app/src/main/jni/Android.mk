LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)  

LOCAL_MODULE    := redis

REDIS_ANDROID_DIR := redis-android
REDIS_DIR := redis-2.5.12

LOCAL_LDLIBS := -llog
LOCAL_CFLAGS += -O2  -I$(LOCAL_PATH)/$(REDIS_ANDROID_DIR) -D__ANDROID__

LOCAL_SRC_FILES += \
 $(REDIS_ANDROID_DIR)/redisAndroid.c

ifeq ($(REDIS_DIR),redis-2.5.12)
  LUA_DIR := $(REDIS_DIR)/lua

  LOCAL_CFLAGS += -I$(LOCAL_PATH)/$(LUA_DIR)

  LOCAL_SRC_FILES += \
   $(REDIS_DIR)/adlist.c $(REDIS_DIR)/ae.c $(REDIS_DIR)/anet.c \
   $(REDIS_DIR)/dict.c $(REDIS_DIR)/redis.c $(REDIS_DIR)/sds.c \
   $(REDIS_DIR)/zmalloc.c $(REDIS_DIR)/lzf_c.c $(REDIS_DIR)/lzf_d.c \
   $(REDIS_DIR)/pqsort.c $(REDIS_DIR)/zipmap.c $(REDIS_DIR)/sha1.c \
   $(REDIS_DIR)/ziplist.c $(REDIS_DIR)/release.c $(REDIS_DIR)/networking.c \
   $(REDIS_DIR)/util.c $(REDIS_DIR)/object.c $(REDIS_DIR)/db.c \
   $(REDIS_DIR)/replication.c $(REDIS_DIR)/rdb.c $(REDIS_DIR)/t_string.c \
   $(REDIS_DIR)/t_list.c $(REDIS_DIR)/t_set.c $(REDIS_DIR)/t_zset.c \
   $(REDIS_DIR)/t_hash.c $(REDIS_DIR)/config.c \
   $(REDIS_DIR)/aof.c $(REDIS_DIR)/pubsub.c $(REDIS_DIR)/multi.c \
   $(REDIS_DIR)/debug.c $(REDIS_DIR)/sort.c $(REDIS_DIR)/intset.c $(REDIS_DIR)/syncio.c \
   $(REDIS_DIR)/migrate.c $(REDIS_DIR)/endianconv.c $(REDIS_DIR)/slowlog.c \
   $(REDIS_DIR)/scripting.c $(REDIS_DIR)/bio.c \
   $(REDIS_DIR)/rio.c $(REDIS_DIR)/rand.c $(REDIS_DIR)/memtest.c \
   $(REDIS_DIR)/crc64.c $(REDIS_DIR)/bitops.c $(REDIS_DIR)/wait3.c


  LOCAL_SRC_FILES += \
   $(LUA_DIR)/lapi.c $(LUA_DIR)/lcode.c $(LUA_DIR)/ldebug.c $(LUA_DIR)/ldo.c $(LUA_DIR)/ldump.c \
   $(LUA_DIR)/lfunc.c $(LUA_DIR)/lgc.c $(LUA_DIR)/llex.c $(LUA_DIR)/lmem.c $(LUA_DIR)/lobject.c \
   $(LUA_DIR)/lopcodes.c $(LUA_DIR)/lparser.c $(LUA_DIR)/lstate.c $(LUA_DIR)/lstring.c \
   $(LUA_DIR)/ltable.c $(LUA_DIR)/ltm.c $(LUA_DIR)/lundump.c $(LUA_DIR)/lvm.c $(LUA_DIR)/lzio.c \
   $(LUA_DIR)/strbuf.c $(LUA_DIR)/lauxlib.c $(LUA_DIR)/lbaselib.c $(LUA_DIR)/ldblib.c \
   $(LUA_DIR)/liolib.c $(LUA_DIR)/lmathlib.c $(LUA_DIR)/loslib.c $(LUA_DIR)/ltablib.c \
   $(LUA_DIR)/lstrlib.c $(LUA_DIR)/loadlib.c $(LUA_DIR)/linit.c $(LUA_DIR)/lua_cjson.c \
   $(LUA_DIR)/lua_struct.c $(LUA_DIR)/lua_cmsgpack.c
endif

ifeq ($(REDIS_DIR),redis-3.2.5)

  LOCAL_CFLAGS += -I$(LOCAL_PATH)/deps/$(LUA_DIR)/src

  REDIS_DIR_SRC := $(REDIS_DIR)/src

  LOCAL_SRC_FILES += \
    $(REDIS_DIR_SRC)/adlist.c $(REDIS_DIR_SRC)/ae.c  $(REDIS_DIR_SRC)/ae_epoll.c \
    $(REDIS_DIR_SRC)/ae_evport.c $(REDIS_DIR_SRC)/ae_kqueue.c $(REDIS_DIR_SRC)/ae_sekect.c \
    $(REDIS_DIR_SRC)/anet.c $(REDIS_DIR_SRC)/aof.c $(REDIS_DIR_SRC)/bio.c \
    $(REDIS_DIR_SRC)/bitops.c $(REDIS_DIR_SRC)/blocked.c $(REDIS_DIR_SRC)/cluster.c \
    $(REDIS_DIR_SRC)/config.c $(REDIS_DIR_SRC)/crc16.c $(REDIS_DIR_SRC)/crc64.c \
    $(REDIS_DIR_SRC)/db.c $(REDIS_DIR_SRC)/debug.c $(REDIS_DIR_SRC)/debugmacro.c \
    $(REDIS_DIR_SRC)/dict.c $(REDIS_DIR_SRC)/endianconv.c $(REDIS_DIR_SRC)/geo.c \
    $(REDIS_DIR_SRC)/hyperloglog.c $(REDIS_DIR_SRC)/intset.c $(REDIS_DIR_SRC)/latency.c \
    $(REDIS_DIR_SRC)/lzf_c.c $(REDIS_DIR_SRC)/lzf_d.c $(REDIS_DIR_SRC)/memtest.c \
    $(REDIS_DIR_SRC)/multi.c $(REDIS_DIR_SRC)/networking.c $(REDIS_DIR_SRC)/notify.c \
    $(REDIS_DIR_SRC)/object.c $(REDIS_DIR_SRC)/pqsort.c $(REDIS_DIR_SRC)/pubsub.c \
    $(REDIS_DIR_SRC)/quicklist.c $(REDIS_DIR_SRC)/rand.c $(REDIS_DIR_SRC)/rdb.c \
    $(REDIS_DIR_SRC)/redis-benchmark.c $(REDIS_DIR_SRC)/redis-check-aof.c $(REDIS_DIR_SRC)/redis-check-rdb.c \
    $(REDIS_DIR_SRC)/release.c $(REDIS_DIR_SRC)/replication.c $(REDIS_DIR_SRC)/rio.c \
    $(REDIS_DIR_SRC)/scriptinc.c $(REDIS_DIR_SRC)/sds.c $(REDIS_DIR_SRC)/sentinel.c \
    $(REDIS_DIR_SRC)/server.c $(REDIS_DIR_SRC)/setproctitle.c $(REDIS_DIR_SRC)/sha1.c \
    $(REDIS_DIR_SRC)/showlog.c $(REDIS_DIR_SRC)/sort.c $(REDIS_DIR_SRC)/sparkline.c \
    $(REDIS_DIR_SRC)/syncio.c $(REDIS_DIR_SRC)/t_hash.c $(REDIS_DIR_SRC)/t_list.c \
    $(REDIS_DIR_SRC)/t_set.c $(REDIS_DIR_SRC)/t_string.c $(REDIS_DIR_SRC)/t_zset.c \
    $(REDIS_DIR_SRC)/util.c $(REDIS_DIR_SRC)/wait3.c $(REDIS_DIR_SRC)/ziplist.c \
    $(REDIS_DIR_SRC)/zipmap.c $(REDIS_DIR_SRC)/zmalloc.c

  LOCAL_SRC_FILES += \
    $(LUA_DIR)/fpconv.c $(LUA_DIR)/lapi.c $(LUA_DIR)/lauxlib.c $(LUA_DIR)/lbaselib.c \
    $(LUA_DIR)/lcode.c $(LUA_DIR)/ldblib.c $(LUA_DIR)/ldebug.c $(LUA_DIR)/ldo.c \
    $(LUA_DIR)/ldump.c $(LUA_DIR)/lfunc.c $(LUA_DIR)/lgc.c $(LUA_DIR)/linit.c \
    $(LUA_DIR)/liolib.c $(LUA_DIR)/llex.c $(LUA_DIR)/llimits.c $(LUA_DIR)/lmathlib.c \
    $(LUA_DIR)/lmem.c $(LUA_DIR)/loadlib.c $(LUA_DIR)/lobject.c \
    $(LUA_DIR)/lopcodes.c $(LUA_DIR)/loslib.c $(LUA_DIR)/lparser.c $(LUA_DIR)/lstate.c \
    $(LUA_DIR)/lstring.c $(LUA_DIR)/lstrlib.c $(LUA_DIR)/ltable.c $(LUA_DIR)/ltablib.c \
    $(LUA_DIR)/ltm.c $(LUA_DIR)/lua.c $(LUA_DIR)/lua_bit.c $(LUA_DIR)/lua_cjson.c \
    $(LUA_DIR)/lua_cmsgpack.c $(LUA_DIR)/lua_struct.c $(LUA_DIR)/luac.c \
    $(LUA_DIR)/lualib.c $(LUA_DIR)/lundump.c $(LUA_DIR)/lvm.c $(LUA_DIR)/lzio.c \
     $(LUA_DIR)/print.c $(LUA_DIR)/strbuf.c
endif

include $(BUILD_SHARED_LIBRARY)
