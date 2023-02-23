package com.nativeplugin.androidnativeplugin

import android.annotation.SuppressLint
import android.content.DialogInterface
import android.widget.Toast
import android.app.AlertDialog;
import android.content.Intent
import android.os.Bundle
import android.util.Log

import androidx.compose.ui.graphics.Color
import androidx.activity.compose.setContent
import androidx.compose.animation.ExperimentalAnimationApi
import androidx.activity.ComponentActivity
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.unity3d.player.UnityPlayer
import com.devsisters.devplay.design.button.*

@SuppressLint("RestrictedApi")
class TextButtonActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        Log.d("Unity", "TextButtonActivity onCreate")

        setContent {
            Box(modifier = Modifier
                .background(Color.White)
                .width(480.dp)
                .height(800.dp),
                contentAlignment = Alignment.Center) {
                TextButton(
                    text = "sampleTextButton",
                    textColor = Color.Black,
                    enabled = true) {
                    Log.d("Unity", "Text Clicked!!!!")
                    finish()
                }
            }

        }

        super.onCreate(savedInstanceState)
    }

    override fun onDestroy() {
        super.onDestroy()
    }
}

object NativeMessage {
    const val objectName = "NativeMessageObject";

    val OnOk = { dialogInterface: DialogInterface, i: Int ->
        UnityPlayer.UnitySendMessage(objectName, "OnOk", "ok");
    }

    val OnCancel = { dialogInterface: DialogInterface, i: Int ->
        UnityPlayer.UnitySendMessage(objectName, "OnCancel", "cancel");
    }

    @JvmStatic
    fun showTextButton() {
        Log.d("Unity", "init show text button")
        val unityActivity = UnityPlayer.currentActivity

        val intent = Intent(unityActivity, TextButtonActivity::class.java)
        unityActivity.startActivity(
            intent
        )
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