import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  GlobalKey<NavigatorState>? _navigatorKey;

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
        print(
            "Notification clicked: ${response.payload}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        _handleNotificationClick(response.payload);
      },
    );
  }

  void _handleNotificationClick(String? payload) {
    print(
        "Handling notification click with payload: $payload !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    if (payload != null && _navigatorKey != null) {
      _navigatorKey!.currentState?.pushNamed('/newsDetail', arguments: payload);
    }
  }

  Future<void> showNotification({required String newsId}) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'team_composition_channel',
      'Team Composition Notifications',
      importance: Importance.high,
      priority: Priority.high,
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
