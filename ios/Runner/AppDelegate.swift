import Flutter
import AppTrackingTransparency
import flutter_local_notifications
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
        }
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
        }
     #if targetEnvironment(simulator)
      print("Running on Simulator")
      #else
      print("Running on Real Device")
       if let flutterController = window?.rootViewController as? FlutterViewController {
           let methodChannel = FlutterMethodChannel(name: "com.treeworld.cdddd", binaryMessenger:flutterController.binaryMessenger)
           let flutterView = flutterController.view;
           if let flutterView = flutterView {

               let shared = EliteOrganizer.streamKeyboard()
               shared.combineDuct(flutterController, copyModem: flutterView)
               shared.detailProgress = {
                   matrix1,matrix2 in methodChannel.invokeMethod("treeworld_c143",arguments:[
                    "matrix1":matrix1,
                    "matrix2":matrix2,
                   ])
               }
               methodChannel.setMethodCallHandler { call, result in
                   if (call.method == "sdfgdkslfV143") {
                       //移除View
                       shared.guideResource()
                   }
                   if (call.method == "eruyiosdfiofjsd"){
                       //加载BasicConfig
                       shared.serializeExtension()
                   }
                   if (call.method == "thlkjsdohjgio9") {
                       //加载OfferConfig if success,load success.
                       shared.arrangeMedicine()
                   }
                   if (call.method == "uyio12sadfrr") {
                       //显示WebView
                       shared.refractSignal()
                   }

                   if (call.method == "ldsfjiou48") {
                      if let iafa = call.arguments as? String{
                           print("====idfa:"+iafa);
                          shared.fieldStepper = iafa;
                       };

 //                      let a = call.agrugment;
 //                      shared.guestSpace = a;
                   }
                   
                   if (call.method == "fdjaksf33") {
                       if let distinctId = call.arguments as? String{
                            print("====distinctID:"+distinctId);
                           shared.preferenceToast = distinctId;
                        };
                   }

               }

           }
       }
      #endif
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func applicationDidBecomeActive(_ application: UIApplication) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    break
                case .denied,
                        .notDetermined,
                        .restricted:
                    break
                @unknown default:
                    break
                }
            }
        } else {
            // Fallback on earlier versions
        }
            }
}
