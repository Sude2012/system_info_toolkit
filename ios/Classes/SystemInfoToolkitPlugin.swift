import Flutter
import UIKit

public class SystemInfoToolkitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_info_toolkit", binaryMessenger: registrar.messenger())
    let instance = SystemInfoToolkitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getBrightness":
      result(Double(UIScreen.main.brightness))
    case "getBatteryLevel":
      UIDevice.current.isBatteryMonitoringEnabled = true
      let level = Int(UIDevice.current.batteryLevel * 100)
      result(level)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}