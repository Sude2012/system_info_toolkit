import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'system_info_toolkit_platform_interface.dart';

/// An implementation of [SystemInfoToolkitPlatform] that uses method channels.
class MethodChannelSystemInfoToolkit extends SystemInfoToolkitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('system_info_toolkit');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
