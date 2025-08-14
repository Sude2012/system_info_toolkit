import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_info_toolkit/system_info_toolkit_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelSystemInfoToolkit platform = MethodChannelSystemInfoToolkit();
  const MethodChannel channel = MethodChannel('system_info_toolkit');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
