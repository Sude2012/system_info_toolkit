import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_info_toolkit/system_info_toolkit.dart';

void main() {
  const MethodChannel channel = MethodChannel('system_info_toolkit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          if (methodCall.method == 'getBrightness') {
            return 0.75;
          } else if (methodCall.method == 'getBatteryLevel') {
            return 85;
          }
          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('Parlaklık değeri doğru dönüyor mu', () async {
    final brightness = await SystemInfoToolkit.getBrightness();
    expect(brightness, 0.75);
  });

  test('Pil seviyesi doğru dönüyor mu', () async {
    final batteryLevel = await SystemInfoToolkit.getBatteryLevel();
    expect(batteryLevel, 85);
  });
}
