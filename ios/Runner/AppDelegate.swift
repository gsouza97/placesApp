import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("pk.eyJ1IjoiZ3NvdXphOTciLCJhIjoiY2tsaWczNXF5MDg3eDJubzAxNzRnOXZ1MiJ9.Bdq_KtEPOXmJpvRHc6c6Dg")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
