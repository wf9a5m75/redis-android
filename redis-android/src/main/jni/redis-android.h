
#ifndef REDIS_ANDROID_H
#define REDIS_ANDROID_H

#include <jni.h>
#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include <android/log.h>
#include "redis-android.h"
#define DEBUG_TAG "redis-android"

extern pthread_t exitThread;
void exit(int statusCode);
int redis_start(JNIEnv * env, jobject this, jstring j_configs); // defined in redis.c
char* convertJStringToChar(JNIEnv* env, jstring j_string);

// Register c++ functions to VM through JNI
// http://kznote.blogspot.com/2013/01/androidnative.html
//
// B - byte
// C - char
// D - double
// F - float
// I - int
// J - long
// S - short
// V - void
// Z - boolean
// l - jobject
// L(java class name); - Java class name. i.e : Ljava/lang/String;
// [(class name) - array of class name.  i.e.: byte str[]  -> [B
static JNINativeMethod method_table[] = {
  {"native_redisStart", "(Ljava/lang/String;)I", (void *) redis_start}
};

JNIEXPORT jint JNI_OnLoad(JavaVM* vm, void* reserved);

#endif
