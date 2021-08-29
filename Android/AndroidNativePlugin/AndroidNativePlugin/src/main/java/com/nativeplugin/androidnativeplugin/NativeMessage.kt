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
    fun showToast(message: String) {
        val context = UnityPlayer.currentActivity.getApplicationContext();

        UnityPlayer.currentActivity.runOnUiThread {
            Toast.makeText(context, message, Toast.LENGTH_LONG).show();
        }
    }

    @JvmStatic
    fun showAlertOneButton(message: String, okStr: String) {
        val context = UnityPlayer.currentActivity;

        UnityPlayer.currentActivity.runOnUiThread {
            AlertDialog.Builder(context)
                .setTitle("Alert")
                .setMessage(message)
                .setPositiveButton(okStr, OnOk)
                .show();
        }
    }

    @JvmStatic
    fun showAlertTwoButton(message: String, okStr: String, cancelStr: String) {
        val context = UnityPlayer.currentActivity;

        UnityPlayer.currentActivity.runOnUiThread {
            AlertDialog.Builder(context)
                .setTitle("Alert")
                .setMessage(message)
                .setPositiveButton(okStr, OnOk)
                .setNegativeButton(cancelStr, OnCancel)
                .show();
        }
    }
}