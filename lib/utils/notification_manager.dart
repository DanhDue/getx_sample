import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:getx_sample/app/routes/links.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  static final NotificationManager _singleton = NotificationManager._internal();

  factory NotificationManager() {
    return _singleton;
  }

  NotificationManager._internal();

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Streams are created so that app can respond to notification-related events
  /// since the plugin is initialised in the `main` function
  static final BehaviorSubject<ReceivedNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  static final BehaviorSubject<String?> selectNotificationSubject =
      BehaviorSubject<String?>();

  static const MethodChannel platform = MethodChannel('danhdue.com/solar_coin');

  static String? selectedNotificationPayload;

  Future initialize() async {
    await _configureLocalTimeZone();

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        !kIsWeb && GetPlatform.isLinux
            ? null
            : await NotificationManager.flutterLocalNotificationsPlugin
                .getNotificationAppLaunchDetails();

    String initialRoute = AppLinks.splash;
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      NotificationManager.selectedNotificationPayload =
          notificationAppLaunchDetails!.payload;
      initialRoute = AppLinks.dashboard;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {
              NotificationManager.didReceiveLocalNotificationSubject.add(
                ReceivedNotification(
                  id: id,
                  title: title,
                  body: body,
                  payload: payload,
                ),
              );
            });

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await NotificationManager.flutterLocalNotificationsPlugin.initialize(
        initializationSettings, onSelectNotification: (String? payload) async {
      if (payload != null) {
        Fimber.d('notification payload: $payload');
      }
      NotificationManager.selectedNotificationPayload = payload;
      NotificationManager.selectNotificationSubject.add(payload);
    });
  }

  void requestPermissions() {
    NotificationManager.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    NotificationManager.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void configureDidReceiveLocalNotificationSubject() {
    NotificationManager.didReceiveLocalNotificationSubject.stream
        .listen((ReceivedNotification receivedNotification) async {
      Fimber.d('didReceiveLocalNotificationSubject');
    });
  }

  void configureSelectNotificationSubject() {
    NotificationManager.selectNotificationSubject.stream
        .listen((String? payload) async {
      await Get.toNamed(AppLinks.dashboard);
    });
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

Future<void> _configureLocalTimeZone() async {
  if (kIsWeb || GetPlatform.isLinux) {
    return;
  }
  tz.initializeTimeZones();
  final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName!));
}
