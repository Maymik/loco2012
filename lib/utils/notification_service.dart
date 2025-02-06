import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  GlobalKey<NavigatorState>? _navigatorKey;

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  Future<void> init(GlobalKey<NavigatorState> navigatorKey) async {
    _navigatorKey = navigatorKey;

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("🔔 Foreground notification clicked: ${response.payload}");
        _handleNotificationClick(response.payload);
      },
      onDidReceiveBackgroundNotificationResponse: backgroundNotificationHandler,
    );

    final details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      print(
          "🚀 App launched from notification! Payload: ${details!.notificationResponse?.payload}");
      _handleNotificationClick(details.notificationResponse?.payload);
    }
  }

  void _handleNotificationClick(String? payload) {
    if (payload != null && _navigatorKey?.currentState != null) {
      print('✅ Navigating to /newsDetail with payload: $payload');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _navigatorKey!.currentState!
            .pushNamed('/newsDetail', arguments: payload);
      });
    }
  }

  Future<void> showNotification({required String newsId}) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'new_channel',
      'New Channel Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Нова новина!',
      'Перегляньте деталі новини.',
      details,
      payload: newsId,
    );
  }
}

@pragma('vm:entry-point')
void backgroundNotificationHandler(NotificationResponse response) {
  print("🛑 Background notification clicked: ${response.payload}");
}
