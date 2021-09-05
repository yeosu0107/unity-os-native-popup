package com.nativeplugin.androidnativeplugin

import android.content.DialogInterface
import android.widget.Toast
import android.app.AlertDialog;
import com.unity3d.player.UnityPlayer

object NativeMessage {
    const val objectName = "NativeMessageObject";

    val OnOk = { dialogInterface: DialogInterface, i: Int ->
        UnityPlayer.UnitySendMessage(objectName, "OnOk", "ok");
    }

    val OnCancel = { dialogInterface: DialogInterface, i: Int ->
        UnityPlayer.UnitySendMessage(objectName, "OnCancel", "cancel");
    }

    @JvmStatic
    fun showToast(message: String, duration: Int) {
        val context = UnityPlayer.currentActivity.getApplicationContext();

        val toastDuration = if(duration == 0) {
            Toast.LENGTH_SHORT
        } else {
            Toast.LENGTH_LONG
        }

        UnityPlayer.currentActivity.runOnUiThread {
            Toast.makeText(context, message, toastDuration).show();
        }
    }

    @JvmStatic
    fun showAlertOneButton(title: String, message: String, okStr: String) {
        val context = UnityPlayer.currentActivity;

        UnityPlayer.currentActivity.runOnUiThread {
            AlertDialog.Builder(context)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton(okStr, OnOk)
                .show();
        }
    }

    @JvmStatic
    fun showAlertTwoButton(title: String, message: String, okStr: String, cancelStr: String) {
        val context = UnityPlayer.currentActivity;

        UnityPlayer.currentActivity.runOnUiThread {
            AlertDialog.Builder(context)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton(okStr, OnOk)
                .setNegativeButton(cancelStr, OnCancel)
                .show();
        }
    }
}