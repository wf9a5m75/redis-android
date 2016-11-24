package it.rikiji.android.redis;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

public class RedisService extends Service {

  private static final String TAG = "RedisService";
  static {
    System.loadLibrary("redis");
  }

  private native void native_redisStart(String app_cache_dir);

  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  @Override
  public void onCreate() {
    Log.d(TAG, "creating");
  }

  @Override
  public void onDestroy() {
    Log.d(TAG, "destroying");
  }

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