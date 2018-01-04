# Redis on Android (server)

This library allows you to run a Redis DB on Android devices.
You can store data, get it, pubsub, ... etc, you can manipulate the DB like normal Redis.

This repository is forked from [rikiji/redis-android](https://github.com/rikiji/redis-android), because the original author [Riccardo](http://rikiji.it/2012/08/21/Redis-Android-NDK-port.html) does not work on this anymore.
But thank you for your hard work, @rikiji

## Redis version

Jan/03/2018  Redis 4.0.6

## Install

In order to use this library, you need to add the below two lines into your `build.gradle` file.

**build.gradle**
```
repositories {
    maven { url "https://raw.githubusercontent.com/wf9a5m75/redis-android/master/repository/" }
}

dependencies {
    compile 'io.wf9a5m75:redis-android:1.0.3'
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

## How to connect to the Redis DB from adb shell?

You need **ROOT** permission of your device.

1. Download the pre-build-libs.zip file from here.

https://github.com/wf9a5m75/redis-android/releases

2. Extract it

3. push the `redis-cli` file into your device.

```
$> adb root

$> adb remount // or adb shell 'mount -o rw,remount /system'

$> adb push redis-cli /system/xbin/redis-cli

$> adb shell chmod 0755 /system/xbin/redis-cli

$> adb shell chown root.shell /system/xbin/redis-cli

$> adb shell

#> redis-cli

```

# Playing with Redis

```
redis-cli -h 192.168.86.23
192.168.86.23:6379> ping
PONG
192.168.86.23:6379> set foo bar
OK
192.168.86.23:6379> get foo
"bar"
192.168.86.23:6379> incr mycounter
(integer) 1
192.168.86.23:6379> incr mycounter
(integer) 2
192.168.86.23:6379> keys *
1) "mycounter"
2) "foo"
192.168.86.23:6379> get mycounter
"2"
192.168.86.23:6379>
```

![](https://github.com/wf9a5m75/redis-android/blob/master/images/playing.gif?raw=true)
