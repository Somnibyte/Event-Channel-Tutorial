import Flutter
import UIKit

public class SwiftEventChannelTutorialPlugin: NSObject, FlutterPlugin {
    
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "event_channel_tutorial", binaryMessenger: registrar.messenger())
    let instance = SwiftEventChannelTutorialPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let randomNumberChannel = FlutterEventChannel(name: "random_number_channel", binaryMessenger: registrar.messenger())
    let randomNumberStreamHandler = RandomNumberStreamHandler()
    randomNumberChannel.setStreamHandler(randomNumberStreamHandler)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
