LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)  

LOCAL_LDLIBS := -llog
LOCAL_CFLAGS += -O2 -I$(LOCAL_PATH)/lua -D__ANDROID__

LOCAL_MODULE    := redis
LOCAL_SRC_FILES := adlist.c ae.c anet.c dict.c redis.c sds.c zmalloc.c lzf_c.c lzf_d.c pqsort.c zipmap.c sha1.c ziplist.c release.c networking.c util.c object.c db.c replication.c rdb.c t_string.c t_list.c t_set.c t_zset.c t_hash.c config.c aof.c pubsub.c multi.c debug.c sort.c intset.c syncio.c migrate.c endianconv.c slowlog.c scripting.c bio.c rio.c rand.c memtest.c crc64.c bitops.c lua/lapi.c lua/lcode.c lua/ldebug.c lua/ldo.c lua/ldump.c lua/lfunc.c lua/lgc.c lua/llex.c lua/lmem.c lua/lobject.c lua/lopcodes.c lua/lparser.c lua/lstate.c lua/lstring.c lua/ltable.c lua/ltm.c lua/lundump.c lua/lvm.c lua/lzio.c lua/strbuf.c lua/lauxlib.c lua/lbaselib.c lua/ldblib.c lua/liolib.c lua/lmathlib.c lua/loslib.c lua/ltablib.c lua/lstrlib.c lua/loadlib.c lua/linit.c lua/lua_cjson.c lua/lua_struct.c lua/lua_cmsgpack.c

include $(BUILD_SHARED_LIBRARY)  