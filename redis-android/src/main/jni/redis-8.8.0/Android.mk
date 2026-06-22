ORG_LOCAL_PATH := $(call my-dir)
SRC := src
DEPS := deps
VSET_SRC := modules/vector-sets

REDIS_COMMON_CFLAGS := \
  -O3 \
  -D__ANDROID__ \
  -D__REDIS_ANDROID__ \
  -DREDIS_STATIC='' \
  -DUSE_LOCAL_TRE_H \
  -DHDR_MALLOC_INCLUDE=\"hdr_redis_malloc.h\" \
  -std=gnu11 \
  -pedantic \
  -W \
  -Wno-missing-field-initializers \
  -Wno-c11-extensions \
  -funwind-tables

#------------------
# Lua bundled by Redis 8.8.0
#------------------
include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-lua
LUA_SRC := $(DEPS)/lua/src
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS) -DLUA_USE_POSIX
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(LUA_SRC)
LOCAL_SRC_FILES := \
  $(LUA_SRC)/lapi.c \
  $(LUA_SRC)/lcode.c \
  $(LUA_SRC)/ldebug.c \
  $(LUA_SRC)/ldo.c \
  $(LUA_SRC)/ldump.c \
  $(LUA_SRC)/lfunc.c \
  $(LUA_SRC)/lgc.c \
  $(LUA_SRC)/llex.c \
  $(LUA_SRC)/lmem.c \
  $(LUA_SRC)/lobject.c \
  $(LUA_SRC)/lopcodes.c \
  $(LUA_SRC)/lparser.c \
  $(LUA_SRC)/lstate.c \
  $(LUA_SRC)/lstring.c \
  $(LUA_SRC)/ltable.c \
  $(LUA_SRC)/ltm.c \
  $(LUA_SRC)/lundump.c \
  $(LUA_SRC)/lvm.c \
  $(LUA_SRC)/lzio.c \
  $(LUA_SRC)/strbuf.c \
  $(LUA_SRC)/fpconv.c \
  $(LUA_SRC)/lauxlib.c \
  $(LUA_SRC)/lbaselib.c \
  $(LUA_SRC)/ldblib.c \
  $(LUA_SRC)/liolib.c \
  $(LUA_SRC)/lmathlib.c \
  $(LUA_SRC)/loslib.c \
  $(LUA_SRC)/ltablib.c \
  $(LUA_SRC)/lstrlib.c \
  $(LUA_SRC)/loadlib.c \
  $(LUA_SRC)/linit.c \
  $(LUA_SRC)/lua_cjson.c \
  $(LUA_SRC)/lua_struct.c \
  $(LUA_SRC)/lua_cmsgpack.c \
  $(LUA_SRC)/lua_bit.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(LUA_SRC)
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-hiredis
HIREDIS_SRC := $(DEPS)/hiredis
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(HIREDIS_SRC)
LOCAL_SRC_FILES := \
  $(HIREDIS_SRC)/alloc.c \
  $(HIREDIS_SRC)/net.c \
  $(HIREDIS_SRC)/hiredis.c \
  $(HIREDIS_SRC)/sds.c \
  $(HIREDIS_SRC)/async.c \
  $(HIREDIS_SRC)/read.c \
  $(HIREDIS_SRC)/sockcompat.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(HIREDIS_SRC)
include $(BUILD_STATIC_LIBRARY)

#------------------
# Redis 8.8.0 support libraries
#------------------
include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-hdrhistogram
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/hdr_histogram $(LOCAL_PATH)/$(SRC)
LOCAL_SRC_FILES := $(DEPS)/hdr_histogram/hdr_histogram.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/hdr_histogram
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-fpconv
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/fpconv
LOCAL_SRC_FILES := $(DEPS)/fpconv/fpconv_dtoa.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/fpconv
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-xxhash
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/xxhash
LOCAL_SRC_FILES := $(DEPS)/xxhash/xxhash.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(DEPS)/xxhash
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis8-tre
TRE_SRC := $(DEPS)/tre
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS) -DTRE_REGEX_T_FIELD=value
LOCAL_C_INCLUDES := $(LOCAL_PATH)/$(TRE_SRC)/local_includes $(LOCAL_PATH)/$(TRE_SRC)/lib
LOCAL_SRC_FILES := \
  $(TRE_SRC)/lib/regcomp.c \
  $(TRE_SRC)/lib/regerror.c \
  $(TRE_SRC)/lib/regexec.c \
  $(TRE_SRC)/lib/tre-ast.c \
  $(TRE_SRC)/lib/tre-compile.c \
  $(TRE_SRC)/lib/tre-filter.c \
  $(TRE_SRC)/lib/tre-match-backtrack.c \
  $(TRE_SRC)/lib/tre-match-parallel.c \
  $(TRE_SRC)/lib/tre-mem.c \
  $(TRE_SRC)/lib/tre-parse.c \
  $(TRE_SRC)/lib/tre-stack.c \
  $(TRE_SRC)/lib/xmalloc.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/$(TRE_SRC)/local_includes $(LOCAL_PATH)/$(TRE_SRC)/lib
include $(BUILD_STATIC_LIBRARY)

#------------------
# libredis.so
#------------------
include $(CLEAR_VARS)
LOCAL_PATH := $(ORG_LOCAL_PATH)
LOCAL_MODULE := redis
LOCAL_LDLIBS := -llog -lm
LOCAL_CFLAGS := $(REDIS_COMMON_CFLAGS) -DINCLUDE_VEC_SETS=1
LOCAL_C_INCLUDES := \
  $(LOCAL_PATH)/$(SRC) \
  $(LOCAL_PATH)/$(VSET_SRC) \
  $(LOCAL_PATH)/../ \
  $(LOCAL_PATH)/$(DEPS)/hiredis \
  $(LOCAL_PATH)/$(DEPS)/lua/src \
  $(LOCAL_PATH)/$(DEPS)/hdr_histogram \
  $(LOCAL_PATH)/$(DEPS)/fpconv \
  $(LOCAL_PATH)/$(DEPS)/xxhash \
  $(LOCAL_PATH)/$(DEPS)/tre/local_includes \
  $(LOCAL_PATH)/$(DEPS)/tre/lib
LOCAL_STATIC_LIBRARIES := \
  libbthread \
  redis8-lua \
  redis8-hiredis \
  redis8-hdrhistogram \
  redis8-fpconv \
  redis8-xxhash \
  redis8-tre

# JNI entry point.
LOCAL_SRC_FILES := ../redis-android.c

LOCAL_SRC_FILES += \
  $(SRC)/threads_mngr.c \
  $(SRC)/memory_prefetch.c \
  $(SRC)/adlist.c \
  $(SRC)/quicklist.c \
  $(SRC)/ae.c \
  $(SRC)/anet.c \
  $(SRC)/dict.c \
  $(SRC)/ebuckets.c \
  $(SRC)/eventnotifier.c \
  $(SRC)/iothread.c \
  $(SRC)/mstr.c \
  $(SRC)/entry.c \
  $(SRC)/kvstore.c \
  $(SRC)/fwtree.c \
  $(SRC)/estore.c \
  $(SRC)/server.c \
  $(SRC)/sds.c \
  $(SRC)/zmalloc.c \
  $(SRC)/lzf_c.c \
  $(SRC)/lzf_d.c \
  $(SRC)/pqsort.c \
  $(SRC)/zipmap.c \
  $(SRC)/sha1.c \
  $(SRC)/ziplist.c \
  $(SRC)/release.c \
  $(SRC)/networking.c \
  $(SRC)/util.c \
  $(SRC)/object.c \
  $(SRC)/db.c \
  $(SRC)/replication.c \
  $(SRC)/rdb.c \
  $(SRC)/t_string.c \
  $(SRC)/t_list.c \
  $(SRC)/t_set.c \
  $(SRC)/t_zset.c \
  $(SRC)/t_hash.c \
  $(SRC)/t_array.c \
  $(SRC)/sparsearray.c \
  $(SRC)/config.c \
  $(SRC)/aof.c \
  $(SRC)/pubsub.c \
  $(SRC)/multi.c \
  $(SRC)/debug.c \
  $(SRC)/sort.c \
  $(SRC)/intset.c \
  $(SRC)/syncio.c \
  $(SRC)/cluster.c \
  $(SRC)/cluster_asm.c \
  $(SRC)/cluster_legacy.c \
  $(SRC)/cluster_slot_stats.c \
  $(SRC)/crc16.c \
  $(SRC)/endianconv.c \
  $(SRC)/slowlog.c \
  $(SRC)/eval.c \
  $(SRC)/bio.c \
  $(SRC)/rio.c \
  $(SRC)/rand.c \
  $(SRC)/memtest.c \
  $(SRC)/syscheck.c \
  $(SRC)/crcspeed.c \
  $(SRC)/crccombine.c \
  $(SRC)/crc64.c \
  $(SRC)/bitops.c \
  $(SRC)/sentinel.c \
  $(SRC)/notify.c \
  $(SRC)/blocked.c \
  $(SRC)/hyperloglog.c \
  $(SRC)/latency.c \
  $(SRC)/sparkline.c \
  $(SRC)/redis-check-rdb.c \
  $(SRC)/redis-check-aof.c \
  $(SRC)/geo.c \
  $(SRC)/lazyfree.c \
  $(SRC)/module.c \
  $(SRC)/evict.c \
  $(SRC)/expire.c \
  $(SRC)/geohash.c \
  $(SRC)/geohash_helper.c \
  $(SRC)/childinfo.c \
  $(SRC)/defrag.c \
  $(SRC)/siphash.c \
  $(SRC)/rax.c \
  $(SRC)/t_stream.c \
  $(SRC)/listpack.c \
  $(SRC)/localtime.c \
  $(SRC)/lolwut.c \
  $(SRC)/lolwut5.c \
  $(SRC)/lolwut6.c \
  $(SRC)/lolwut8.c \
  $(SRC)/acl.c \
  $(SRC)/tracking.c \
  $(SRC)/socket.c \
  $(SRC)/tls.c \
  $(SRC)/sha256.c \
  $(SRC)/timeout.c \
  $(SRC)/setcpuaffinity.c \
  $(SRC)/monotonic.c \
  $(SRC)/mt19937-64.c \
  $(SRC)/resp_parser.c \
  $(SRC)/call_reply.c \
  $(SRC)/script_lua.c \
  $(SRC)/script.c \
  $(SRC)/functions.c \
  $(SRC)/function_lua.c \
  $(SRC)/commands.c \
  $(SRC)/strl.c \
  $(SRC)/connection.c \
  $(SRC)/unix.c \
  $(SRC)/logreqres.c \
  $(SRC)/keymeta.c \
  $(SRC)/chk.c \
  $(SRC)/hotkeys.c \
  $(SRC)/gcra.c \
  $(SRC)/vector.c \
  $(SRC)/fast_float_strtod.c \
  $(VSET_SRC)/hnsw.c \
  $(VSET_SRC)/vset.c \
  $(VSET_SRC)/vset_config.c

include $(BUILD_SHARED_LIBRARY)
