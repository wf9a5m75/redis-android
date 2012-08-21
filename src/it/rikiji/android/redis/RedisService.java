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
	
	private native void rstart();

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
				rstart();
			}
		};
		thread.start();
		return 0;
    }
	
	@Override
	public void onStart(Intent intent, int startid) {
	}
	
}