package it.rikiji.android.redis;

import java.util.Date;

import redis.clients.jedis.Jedis;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Toast;
import android.widget.ToggleButton;

public class Redis extends Activity {

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_redis);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.activity_redis, menu);
		return true;
	}

	public void onToggleClicked(View v) {
		boolean on = ((ToggleButton) v).isChecked();
		if (on) {
			startService(new Intent(this, RedisService.class));
		} else {
			new StopTask().execute(); /* this will exit this app too! */
		}
	}

	public void onClick(View v) {
		new JedisTask().execute();
	}

	private class JedisTask extends AsyncTask<Void, Void, String> {
		@Override
		protected String doInBackground(Void... arg) {
			Jedis jedis = new Jedis("localhost");
			String s = jedis.get("foo");
			jedis.set("foo", new Date().toString());
			return s;
		}

		protected void onPostExecute(String res) {
			Toast.makeText(getApplicationContext(), "previous value: " + res,
					Toast.LENGTH_SHORT).show();
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
