# system_info_toolkit

“A Flutter plugin. Allows you to get screen brightness and battery level information on both Android and iOS devices.”

## My Contact Info

### GitHub

- https://github.com/Sude2012

### Linkedln

- linkedin.com/in/selver-sude-özdemir-23b174296

## Features

- Get the current screen brightness (0.0 - 1.0)
- Get the current battery level (0 - 100)

## Installation

`pubspec.yaml` Add to your file:

```yaml
dependencies:
  system_info_toolkit:
    git:
      url: https://github.com/your_username/system_info_toolkit.git
```

Then run:

```
flutter pub get
```

## Usage

Import the package:

```
import 'package:system_info_toolkit/system_info_toolkit.dart';
```

Get Screen Brightness:

```
double brightness = await SystemInfoToolkit.getBrightness();
print('Current brightness: $brightness');
```

- Returns a value between 0.0 and 1.0.
- Values are automatically clamped to this range.
- Works on both Android and iOS.

Get Battery Level

```
int batteryLevel = await SystemInfoToolkit.getBatteryLevel();
print('BatteryLevel: $batteryLevel%');
```

- Returns an integer between 0 and 100.
- Works on both Android and iOS.

## Example

```
import 'package:flutter/material.dart';
import 'package:system_info_toolkit/system_info_toolkit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('System Info Toolkit Örneği')),
        body: const Center(child: SystemInfoWidget()),
      ),
    );
  }
}

class SystemInfoWidget extends StatefulWidget {
  const SystemInfoWidget({super.key});

  @override
  State<SystemInfoWidget> createState() => _SystemInfoWidgetState();
}

class _SystemInfoWidgetState extends State<SystemInfoWidget> {
  double _brightness = 0.0;
  int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    _loadSystemInfo();
  }

  Future<void> _loadSystemInfo() async {
    final brightness = await SystemInfoToolkit.getBrightness();
    final batteryLevel = await SystemInfoToolkit.getBatteryLevel();

    setState(() {
      _brightness = brightness;
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Brightness: ${(_brightness * 100).toStringAsFixed(0)}%'),
        const SizedBox(height: 16),
        Text('Battery Level: $_batteryLevel%'),
      ],
    );
  }
}
```

## Notes

- On Android, brightness is obtained using Settings.System.SCREEN_BRIGHTNESS (0-255) and converted to a 0.0–1.0 range.
- On iOS, brightness is obtained via UIScreen.main.brightness.
- On iOS, battery monitoring is automatically enabled.
