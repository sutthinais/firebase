// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseMessagingService extends FirebaseMessaging {
//   Future<void> init() async {
//     // ตั้งค่าการรับแจ้งเตือน
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       log('Got a message whilst in the foreground!');
//       log('Message data: ${message.data}');

//       if (message.notification != null) {
//         log('Message also contained a notification: ${message.notification}');
//       }

//       // แสดงตัวแจ้งเตือน
//       _showNotification(message);
//     });

//     // ตั้งค่าการเปิดแอปจากการแจ้งเตือน
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       log('A new onMessageOpenedApp event was published!');
//       log('Message data: ${message.data}');

//       if (message.notification != null) {
//         log('Message also contained a notification: ${message.notification}');
//       }
//     });

//     // ตั้งค่าการเปิดแอปจากลิงก์ที่มีข้อมูลแนบ
//     FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
//       if (message != null) {
//         log('A new onLaunch or onResume event was published!');
//         log('Message data: ${message.data}');

//         if (message.notification != null) {
//           log('Message also contained a notification: ${message.notification}');
//         }
//       }
//     });

// // ตั้งค่าโทเค็นสำหรับส่งแจ้งเตือน
//     String? token = await FirebaseMessaging.instance.getToken();
//     log('FirebaseMessaging token: $token');
// // แสดงตัวแจ้งเตือน
  
//   }


//     Future<void> _showNotification(RemoteMessage message) async {
// // สร้างข้อความแจ้งเตือน
//       AndroidNotification? android = message.notification?.android;
//       IOSNotification? ios = message.notification?.ios;
//       NotificationDetails notificationDetails =
//           NotificationDetails(android: android != null ? AndroidNotificationDetails('channel_id', 'channel_name', 'channel_description', importance: Importance.max, priority: Priority.high, ticker: 'ticker') : null, iOS: ios != null ? IOSNotificationDetails() : null);
//       await FlutterLocalNotificationsPlugin().show(0, message.notification?.title ?? '', message.notification?.body ?? '', notificationDetails);
//     }
// }
