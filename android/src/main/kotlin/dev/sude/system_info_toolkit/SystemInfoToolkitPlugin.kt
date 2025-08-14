package dev.sude.system_info_toolkit

import android.content.Context
import android.os.BatteryManager
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class SystemInfoToolkitPlugin: FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "system_info_toolkit")
        channel.setMethodCallHandler(this)
        context = binding.applicationContext
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getBrightness" -> {
                try {
                    val raw = Settings.System.getInt(context.contentResolver, Settings.System.SCREEN_BRIGHTNESS)
                    result.success(raw.toDouble() / 255.0)
                } catch(e: Exception) {
                    result.error("UNAVAILABLE", "Parlaklık okunamadı: ${e.message}", null)
                }
            }
            "getBatteryLevel" -> {
                try {
                    val bm = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                    val level = bm.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
                    result.success(level)
                } catch(e: Exception) {
                    result.error("UNAVAILABLE", "Pil seviyesi okunamadı: ${e.message}", null)
                }
            }
            else -> result.notImplemented()
        }
    }
}