// ignore_for_file: unused_element

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:getx_home_service/app/modules/app_module/app_controller.dart';
import 'package:getx_home_service/app/themes/app_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:getx_home_service/app/routes/app_pages.dart';
import 'package:getx_home_service/app/themes/app_theme.dart';
import 'package:getx_home_service/app/translations/app_translations.dart';
import 'package:getx_home_service/app/utils/common.dart';

import 'app/data/api/di.dart';
import 'app/utils/app_config.dart';

late AndroidNotificationChannel channel;

// Platform  Firebase App Id
// android   1:660609713234:android:e0ced9c64b4295d2ac0b8b
// ios       1:660609713234:ios:b862b2556133dd03ac0b8b

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications',
      description: 'This channel is used for important notifications.', // title
      importance: Importance.high);

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppController _appController = Get.find();

  @override
  void initState() {
    // _setLanguage();
    _build();
    super.initState();
  }

  _build() async {
    await _initPush();
    await _requestPermission();
    await _listenPushNotification();
    await _getTokenId();
  }

  _initPush() async {
    await FirebaseMessaging.instance.getInitialMessage();
  }

  _getTokenId() {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.getToken().then((token) {
      if (kDebugMode) {
        print('FirebaseMessaging token: $token');
      }
    });
    firebaseMessaging.subscribeToTopic('asset');
  }

  _refreshTokenId() {
    FirebaseMessaging.instance.onTokenRefresh.listen((token) {
      // Update the device token on your server
    }, onError: (error) {
      if (kDebugMode) {
        print("Error refreshing FCM token: ${error.toString()}");
      }
    });
  }

  _requestPermission() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print('User granted provisional permission');
      }
    } else {
      if (kDebugMode) {
        print('User declined or has not accepted permission');
      }
    }
  }

  _listenPushNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode, notification.title, notification.body, NotificationDetails(android: AndroidNotificationDetails(channel.id, channel.name, channelDescription: channel.description, color: AppColors.kPrimaryColor, playSound: true, icon: '@mipmap/ic_launcher')));
      }

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('A new onMessageOpenedApp event was published!');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppConfig(
      appName: AppTranslationKey.APP_NAME_TH,
      debugTag: false,
      flavorName: AppTranslationKey.APP_NAME_TH,
      child: _initPage(),
    );
  }

  _initPage() {
    return GestureDetector(
      // Dismiss keyboard when clicked outside
      onTap: () => {Common.dismissKeyboard(), _appController.onUserActivity()},
      child: GetMaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          defaultScaleFactor: 1.2,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: const ColoredBox(color: AppColors.white),
        ),
        initialRoute: AppRoutes.initial,
        theme: Themes.light,
        getPages: AppPages.pages,
        locale: AppTranslation.locale,
        translationsKeys: AppTranslation.translations,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
