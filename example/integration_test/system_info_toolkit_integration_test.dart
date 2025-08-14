import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:system_info_toolkit/system_info_toolkit.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Brightness ve Battery integration testi', (
    WidgetTester tester,
  ) async {
    final brightness = await SystemInfoToolkit.getBrightness();
    expect(brightness, inInclusiveRange(0.0, 1.0));

    final batteryLevel = await SystemInfoToolkit.getBatteryLevel();
    expect(batteryLevel, inInclusiveRange(0, 100));
  });
}
