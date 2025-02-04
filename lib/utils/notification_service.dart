// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//
//   factory NotificationService() {
//     return _instance;
//   }
//
//   NotificationService._internal();
//
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   Future<void> init() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(settings);
//   }
//
//   Future<void> showNotification() async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'team_composition_channel',
//       'Team Composition Notifications',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       'Гравець доданий!',
//       'Новий гравець був успішно доданий в команду.',
//       details,
//     );
//   }
// }
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

  Future<void> init(BuildContext context) async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleNotificationClick(context, response.payload);
      },
    );
  }

  void _handleNotificationClick(BuildContext context, String? payload) {
    if (payload != null) {
      Navigator.pushNamed(context, payload);
    }
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
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
      'Гравець доданий!',
      'Новий гравець був успішно доданий в команду.',
      details,
      payload: '/detailsNewsScreen',
    );
  }
}
