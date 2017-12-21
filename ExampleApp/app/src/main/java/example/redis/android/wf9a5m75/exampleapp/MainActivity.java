package example.redis.android.wf9a5m75.exampleapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

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
