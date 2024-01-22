import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {}

class PushService extends GetxService {
  bool pushPermission = false;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late InitializationSettings initializationSettings;

  Future init(onInit) async {
    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/launcher_icon");
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    onInit
        ? flutterLocalNotificationsPlugin
            .initialize(
            initializationSettings,
            onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
            onDidReceiveBackgroundNotificationResponse:
                notificationTapBackground,
          )
            .then((value) {
            pushPermission = value ?? false;
          })
        : pushPermission = await flutterLocalNotificationsPlugin.initialize(
              initializationSettings,
              onDidReceiveNotificationResponse:
                  onDidReceiveNotificationResponse,
              onDidReceiveBackgroundNotificationResponse:
                  notificationTapBackground,
            ) ??
            false;
    return this;
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.max,
            priority: Priority.max,
            playSound: true);

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      interruptionLevel: InterruptionLevel.timeSensitive,
    );

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {}

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();

    await flutterLocalNotificationsPlugin.show(id, title, body, details,
        payload: payload);
  }

  Future<void> showScheduledNotification(
      {required int id,
      required String title,
      required String body,
      required String payload,
      required int seconds}) async {
    final details = await _notificationDetails();

    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)), details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload);
  }
}
