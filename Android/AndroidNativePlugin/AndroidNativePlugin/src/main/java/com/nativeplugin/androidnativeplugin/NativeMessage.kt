package com.nativeplugin.androidnativeplugin

import android.util.Log
import android.widget.Toast
import com.unity3d.player.UnityPlayer

object NativeMessage {
    @JvmStatic
    fun showToast(message: String) {
        Log.i("UNITY", "${message}");

        val context = UnityPlayer.currentActivity.getApplicationContext();
        UnityPlayer.currentActivity.runOnUiThread {
            Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        }
    }
}