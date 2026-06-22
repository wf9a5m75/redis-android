package example.redis.android.wf9a5m75.exampleapp;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

public class MainActivity extends Activity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    //------------------------
    // Run redis in service
    //------------------------
    Intent redisServiceIntent = new Intent(MainActivity.this, RedisService.class);
    MainActivity.this.startService(redisServiceIntent);
  }
}
