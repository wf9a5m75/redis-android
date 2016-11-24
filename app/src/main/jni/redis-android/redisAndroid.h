#include <jni.h>
#include <stdio.h>
#include <string.h>

#ifndef REDIS_ANDROID_H
#define REDIS_ANDROID_H

// Keep the application cache directory (working directory path)
extern char * APP_CACHE_DIR;


void redis_start(JNIEnv * env, jobject this, jstring j_appCacheDir); // defined in redis.c

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
  {"native_redisStart", "(Ljava/lang/String;)V", (void *) redis_start}
};

JNIEXPORT jint JNI_OnLoad(JavaVM* vm, void* reserved);
char* convertJStringToChar(JNIEnv* env, jstring j_string);

#endif