# redis-android (server)

This redis-android runs a redis server on Android.
You can store data, get it, pubsub, ... etc, you can manipulate as regular Redis DB.

This repository is forked from [rikiji/redis-android](https://github.com/rikiji/redis-android), because the original author [Riccardo](http://rikiji.it/2012/08/21/Redis-Android-NDK-port.html) does not work on this anymore.
But thank you for your hard work, @rikiji

## Redis version

Dec/21/2017  Redis 4.0.6

## Install

In order to use this library, you need to add the below two lines into your `build.gradle` file.

**build.gradle**
```
repositories {
    maven { url "https://raw.githubusercontent.com/wf9a5m75/redis-android/master/repository/" }
}

dependencies {
    compile 'io.wf9a5m75:redis-android:1.0.0'
}
```

## How to use this in your app?

```java
import io.wf9a5m75.redis.RedisAndroid;

public class MyService extends IntentService {

  public MyService() {
    super("MyService");
  }

  @Nullable
  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  @Override
  protected void onHandleIntent(@Nullable Intent intent) {

    Bundle configs = new Bundle();
    configs.putString("port", "6379");   // <-- strongly recommend to change to different port number
    configs.putString("protected-mode", "no");
    configs.putString("requirepass", "");
    RedisAndroid.start(this, configs);
  }
}
```

## Redis settings

This library specifies default settings for Android in the [RedisAndroid.java](https://github.com/wf9a5m75/redis-android/blob/master/redis-android/src/main/java/io/wf9a5m75/redis/RedisAndroid.java).

You can overwrite these settings for your purpose.

For example, the default `maxmemory = 10mb`, but if you want to increase it,

```java
Bundle configs = new Bundle();
configs.putString("port", "6379");   // <-- strongly recommend to change to different port number
configs.putString("maxmemory", "30mb");
configs.putString("protected-mode", "no");
configs.putString("requirepass", "");
RedisAndroid.start(this, configs);
```

The details of settings are defined at the http://download.redis.io/redis-stable/redis.conf

## How to connect to the Redis DB from your app?

You need to use redis client libraries.

https://redis.io/clients#java
