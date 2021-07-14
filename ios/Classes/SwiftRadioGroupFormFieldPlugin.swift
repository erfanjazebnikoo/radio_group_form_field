import Flutter
import UIKit

public class SwiftRadioGroupFormFieldPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "radio_group_form_field", binaryMessenger: registrar.messenger())
    let instance = SwiftRadioGroupFormFieldPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
