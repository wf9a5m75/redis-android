# redis-android (server)

This redis-android runs a redis server on Android.
You can store data, get it, pubsub, ... etc, you can manipulate as regular Redis DB.

This repository is forked from [rikiji/redis-android](https://github.com/rikiji/redis-android), because the original author [Riccardo](http://rikiji.it/2012/08/21/Redis-Android-NDK-port.html) does not work on this anymore.
But thank you for your hard work, @rikiji

## How to use this?

Download the pre-build libraries from this link.
https://github.com/wf9a5m75/redis-android/releases

### libredis.so (server)

Unzip it, then copy the `(arch)/libredis.so` into your `src/main/libs/(arch)`.

```
app/src/main/libs/
├── arm64-v8a
│   └── libredis.so
├── armeabi-v7a
│   └── libredis.so
├── x86
│   └── libredis.so
└── x86_64
    └── libredis.so
```

Then in your code, you need to create a service like this.

```java
public class RedisService extends Service {

  static {
    System.loadLibrary("redis");
  }

  private native void native_redisStart(String app_cache_dir);

  ...

  public int onStartCommand(Intent intent, int flags, int startId) {
    Log.d(TAG, "starting");
    Thread thread = new Thread() {
      @Override
      public void run() {
        String app_cache_dir = RedisService.this.getCacheDir().getAbsolutePath();
        native_redisStart(app_cache_dir);
      }
    };
    thread.start();
    return 0;
  }
}
```

## How to use this

This app runs the [Redis Database](http://redis.io/) on Android.
This is still experimental version. (Don't claim please.)

You can run the DB tap on the toggle button.
If you toggles off the button, the database is shutdown (also the app is killed).

## Redis version

The current redis version is 4.0.6


## How to use this?

Install the apk file from [here](https://github.com/wf9a5m75/redis-android/blob/master/release/app-debug.apk?raw=true), then launch the redis-android app.
After that, connect to your Android from your pc.

```
$> redis-cli -h 192.168.3.15  <--your Android ip

$> set Hello myMessage

$> get Hello
"myMessage"
```

### Quick Q&A

- Clustering?
-- Not yet.

- Protection mode?
-- Disabled at this time.
