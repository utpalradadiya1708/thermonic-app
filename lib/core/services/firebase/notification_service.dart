// import 'dart:convert';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:injectable/injectable.dart';
// import 'package:thermonic/utils/logger_util.dart';
// import 'package:permission_handler/permission_handler.dart' as AppSettings;
//
// import '../../../utils/utils.dart';
// import '../../common/constants/app_constants.dart';
// import '../../routes/app_pages.dart';
//
// @Singleton()
// class NotificationService extends GetxService {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     // await requestNotificationPermission();
//     await initLocalNotifications();
//     firebaseInit();
//   }
//
//   Future<void> requestNotificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus != AuthorizationStatus.authorized &&
//         settings.authorizationStatus != AuthorizationStatus.provisional) {
//       AppSettings.openAppSettings();
//     }
//   }
//
//   Future<void> initLocalNotifications() async {
//     var androidInitializationSettings = const AndroidInitializationSettings(
//       '@mipmap/ic_launcher',
//     );
//
//     var iosInitializationSettings = const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//       defaultPresentSound: true,
//       defaultPresentAlert: true,
//       defaultPresentBadge: true,
//       defaultPresentBanner: true,
//       defaultPresentList: true,
//     );
//
//     var initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//
//     try {
//       await _flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onDidReceiveNotificationResponse: (payload) async {
//           try {
//             if (payload.payload != null && payload.payload!.isNotEmpty) {
//               final data = jsonDecode(payload.payload!);
//               handleNotification(data, AppState.foreground);
//             }
//           } catch (e) {
//             print("❌ Error decoding notification payload: $e");
//           }
//         },
//         onDidReceiveBackgroundNotificationResponse: (payload) async {
//           MyLogger.log("📦 Background Notification Tapped: ${payload.payload}");
//         },
//       );
//     } catch (e) {
//       MyLogger.log("😢 Init exception: ${e.toString()}", printFullText: true);
//     }
//
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }
//
//   void firebaseInit() {
//     // App is in foreground: show the notification and update counter
//     FirebaseMessaging.onMessage.listen((message) {
//       print("📥 Foreground Notification Received: ${message.data}");
//       showNotification(message);
//
//       final type = message.data["type"];
//       if (type == "manual_notification") {
//         final notificationCounterController =
//             Get.find<NotificationCounterController>();
//         notificationCounterController.increment();
//       }
//     });
//
//     // App was backgrounded, and user tapped the notification
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       print("📲 Notification Opened from Background: ${message.data}");
//       handleNotification(message.data, AppState.background);
//     });
//
//     // App was terminated and launched via tapping the notification
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         print("🚀 App Launched via Notification: ${message.data}");
//         handleNotification(message.data, AppState.terminated);
//       }
//     });
//   }
//
//   Future<void> showNotification(RemoteMessage message) async {
//     RemoteNotification? notification = message.notification;
//     Map<String, dynamic> data = message.data;
//
//     AndroidNotificationChannel androidNotificationChannel =
//         const AndroidNotificationChannel(
//           'high_importance_channel',
//           'High Importance Notifications',
//           description: 'This channel is used for important notifications.',
//           importance: Importance.high,
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//         );
//
//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//           androidNotificationChannel.id,
//           androidNotificationChannel.name,
//           channelDescription: androidNotificationChannel.description,
//           importance: Importance.high,
//           priority: Priority.high,
//           icon: '@mipmap/ic_launcher',
//           playSound: true,
//           enableLights: true,
//           enableVibration: true,
//           largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
//         );
//
//     DarwinNotificationDetails darwinNotificationDetails =
//         DarwinNotificationDetails(
//           presentBanner: true,
//           presentAlert: true,
//           presentBadge: true,
//           presentSound: true,
//           subtitle: notification?.body ?? "",
//         );
//
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinNotificationDetails,
//     );
//
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       notification?.title ?? "",
//       notification?.body ?? "",
//       notificationDetails,
//       payload: jsonEncode(data), // ✅ Properly pass payload for tap handling
//     );
//   }
// }
//
// /// Handles navigation on notification tap
// void handleNotification(Map<String, dynamic> message, AppState appState) {
//   final type = message["type"];
//   print(
//     "🔧 handleNotification | AppState: $appState | Type: $type | Payload: $message",
//   );
//
//   if (type == "logout") {
//     print("🚪 Logout Notification Triggered");
//     if (appState != AppState.terminated) {
//       clearData();
//       Get.offAllNamed(Routes.login);
//     }
//   } else if (type == "manual_notification") {
//     print("📌 Manual Notification Received");
//     final notificationCounterController =
//         Get.find<NotificationCounterController>();
//     notificationCounterController.increment();
//     // Get.toNamed(Routes.myDownloads);
//   } else if (type == "user_chat") {
//     print("💬 Chat Notification Triggered");
//
//     final subjectId = int.tryParse(message["subject_id"].toString()) ?? 0;
//     final trainerId = int.tryParse(message["sender_id"].toString()) ?? 0;
//
//     print(
//       "➡️ Navigating to Chat Detail | subjectId: $subjectId, trainerId: $trainerId",
//     );
//
//     Get.toNamed(
//       Routes.chat,
//       arguments: {
//         ArgumentsConst.trainerId: trainerId,
//         ArgumentsConst.subjectId: subjectId,
//       },
//     );
//   } else {
//     print("ℹ️ Unhandled Notification Type: $type");
//   }
// }
//
// enum AppState { foreground, background, terminated }
