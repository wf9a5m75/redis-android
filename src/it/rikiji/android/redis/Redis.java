package it.rikiji.android.redis;

import android.os.Bundle;
import android.app.Activity;
import android.view.Menu;

public class Redis extends Activity {


	static {  
	    System.loadLibrary("redis");  
	} 
	
	private native void rstart();  

	
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
}
