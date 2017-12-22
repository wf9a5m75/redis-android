package example.redis.android.wf9a5m75.exampleapp;

import android.app.IntentService;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.Nullable;

import io.wf9a5m75.redis.RedisAndroid;

public class RedisService extends IntentService {

  public RedisService() {
    super("RedisService");
  }


  @Nullable
  @Override
  public IBinder onBind(Intent intent) {
    return null;
  }

  @Override
  protected void onHandleIntent(@Nullable Intent intent) {

    Bundle configs = new Bundle();
    configs.putString("protected-mode", "no");
    configs.putString("requirepass", "");
    configs.putString("loglevel", "verbose");
    RedisAndroid.start(this, configs);
  }
}
