# RedisDB on Android

## Redis version

Dec/18/2018  **Redis 5.0.3**

## Description

Redis is known for NoSQL database. You can run Redis database on your server.

**_This library helps you to run Redis database on Android device_**.

This library is just cross-compiled the [original redis database](https://redis.io/) for Android architectures such as ARM cpu.

You can run Redis database in background thread in your application.



## Benefit of running Redis DB on Android

There are some benefits for running Redis DB on Android.

  - NoSQL database in memory

    The most remarkable feature of the Redis DB is `NoSQL`.
    It means you can easily store data with key, and retrieve it (just like JSON object).

  - No Internet is required

    `MongoDB` or `Google Firebase` are known for NoSQL hosted on their cloud servers. However they need to connect to their server through the Internet.
    It is depends on your purpose, but I wanted own hosted database on Android.

  - `TTL` for key

    One of my favorite points of Redis DB is you are able to set `TTL (time to live)`. You can save the key-value pairs that is available only in TTL time.

  - `Publish/Subscriber`

    One of the reason I created this library is Redis DB has `publisher/subscriber` mechanism, like a chat room.
    You can notify your message from one application, and receive the data on another applications, even on multiple devices.

  - No dependencies

    One of the reason I gave up to use `Google Firebase` is that the library requires `Google Play Services`. But my Android does not have it (AOSP rom).
    You can run Redis DB with **only this library.**

## Install

In order to use this library, you need to add the below two lines into your `build.gradle` file.

**build.gradle**
```
repositories {
    maven { url "https://raw.githubusercontent.com/wf9a5m75/redis-android/master/repository/" }
}

dependencies {
    compile 'io.wf9a5m75:redis-android:1.1.4'
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

## redis-cli command

You need to install the command by your hand.
You may need **ROOT** permission of your device.

(`redis-check-aof`, `redis-check-rdb` commands are also the same steps)

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

# Version compatibles

| Redis version | redis-android version |
|---------------|-----------------------|
| Redis 5.0.3   | v1.1.4                |
| Redis 5.0.2   | v1.1.3                |
| Redis 5.0.1   | v1.1.1 - v1.1.2       |
| Redis 5.0.0   | v1.1.0                |
| Redis 4.0.11  | v1.0.8                |
| Redis 4.0.10  | v1.0.7                |
| Redis 4.0.9   | v1.0.6                |
| Redis 4.0.8   | v1.0.4 - v1.0.5       |
| Redis 4.0.6   | v1.0.0 - v1.0.3       |
