#include "redis-android.h"

pthread_t exitThread;

jint JNI_OnLoad(JavaVM* vm, void* reserved) {

  // Register export functions to JAVA
  JNIEnv* env;
  if ((*vm)->GetEnv(vm, (void **) &env, JNI_VERSION_1_6) != JNI_OK) {
    return JNI_ERR;
  } else {
    jclass clazz = (*env)->FindClass(env, "io/wf9a5m75/redis/RedisAndroid");
    if (clazz) {
      int method_table_size = sizeof(method_table) / sizeof(method_table[0]);
      jint ret = (*env)->RegisterNatives(env, clazz, method_table, method_table_size);
      (*env)->DeleteLocalRef(env, clazz);
      return ret == 0 ? JNI_VERSION_1_6 : JNI_ERR;
    } else {
      return JNI_ERR;
    }
  }

  return JNI_VERSION_1_6;
}

char* convertJStringToChar(JNIEnv* env, jstring j_string) {
   const char *nativeString = (*env)->GetStringUTFChars(env, j_string, JNI_FALSE);

   char *c_string = malloc(strlen(nativeString));
   strcpy(c_string, nativeString);

   (*env)->ReleaseStringUTFChars(env, j_string, nativeString);
  return c_string;
}
