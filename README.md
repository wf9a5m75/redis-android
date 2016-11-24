# redis-android

This project is forked from [rikiji/redis-android](https://github.com/rikiji/redis-android).

## Description

This app works as [Redis Database](http://redis.io/) on Android.

The original author of this app does not maintain his repo.

I just fixed a little the app and create the UI.

## Redis version

This project has just started, so the most of code keep original.

The current redis version is 2.5.12.

## How to use this?

Install the apk file from [here](https://github.com/wf9a5m75/redis-android/blob/master/release/app-debug.apk?raw=true), then launch the redis-android app.

After that, connect to the redis db from your pc.

```
$> redis-cli -h (your android ip)

$> set Hello myMessage

$> get Hello
"myMessage"
```

