import 'package:flutter/material.dart';
import 'package:system_info_toolkit/system_info_toolkit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? _brightness;
  int? _batteryLevel;

  @override
  void initState() {
    super.initState();
    _loadMetrics();
  }

  Future<void> _loadMetrics() async {
    final b = await SystemInfoToolkit.getBrightness();
    final p = await SystemInfoToolkit.getBatteryLevel();
    setState(() {
      _brightness = b;
      _batteryLevel = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('System Info Toolkit')),
        body: Center(
          child: _brightness == null || _batteryLevel == null
              ? const CircularProgressIndicator()
              : Text(
                  'Brightness: ${(_brightness! * 100).toStringAsFixed(0)}%\nBattery: $_batteryLevel%',
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _loadMetrics,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
