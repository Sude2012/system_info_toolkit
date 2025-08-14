import 'package:flutter/services.dart';

class SystemInfoToolkit {
  static const MethodChannel _channel = MethodChannel('system_info_toolkit');

  static Future<double> getBrightness() async {
    final value = await _channel.invokeMethod<dynamic>('getBrightness');
    if (value is double) return value.clamp(0.0, 1.0);
    if (value is int) return value.toDouble().clamp(0.0, 1.0);
    throw Exception('Beklenmeyen parlaklık değeri: $value');
  }

  static Future<int> getBatteryLevel() async {
    final value = await _channel.invokeMethod<dynamic>('getBatteryLevel');
    if (value is int) return value.clamp(0, 100);
    throw Exception('Beklenmeyen pil seviyesi: $value');
  }
}
