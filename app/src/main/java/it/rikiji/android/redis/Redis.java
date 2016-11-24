package it.rikiji.android.redis;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.ToggleButton;

import redis.clients.jedis.Jedis;

public class Redis extends Activity {

  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_redis);
  }


  public void onToggleClicked(View v) {
    boolean on = ((ToggleButton) v).isChecked();
    if (on) {
      startService(new Intent(this, RedisService.class));
    } else {
      new StopTask().execute(); /* this will exit this app too! */
    }
  }


  private class StopTask extends AsyncTask<Void, Void, Void> {
    @Override
    protected Void doInBackground(Void... arg) {
      Jedis jedis = new Jedis("localhost");
      jedis.save();
      jedis.shutdown();
      return null;
    }

    protected void onPostExecute(Void res) {
    }
  }
}
