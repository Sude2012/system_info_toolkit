import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_info_toolkit_method_channel.dart';

abstract class SystemInfoToolkitPlatform extends PlatformInterface {
  /// Constructs a SystemInfoToolkitPlatform.
  SystemInfoToolkitPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemInfoToolkitPlatform _instance = MethodChannelSystemInfoToolkit();

  /// The default instance of [SystemInfoToolkitPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemInfoToolkit].
  static SystemInfoToolkitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemInfoToolkitPlatform] when
  /// they register themselves.
  static set instance(SystemInfoToolkitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
