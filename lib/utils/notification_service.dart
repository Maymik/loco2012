// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import '../features/news/ui/news_detail.dart';
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//
//   factory NotificationService() => _instance;
//
//   NotificationService._internal();
//
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   GlobalKey<NavigatorState>? _navigatorKey;
//
//   GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
//
//   Future<void> init(GlobalKey<NavigatorState> navigatorKey) async {
//     _navigatorKey = navigatorKey;
//     print("📌 navigatorKey передан в NotificationService: ${_navigatorKey!.hashCode}");
//
//     const AndroidInitializationSettings androidSettings =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//     );
//
//     await _flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         print("🔔 Foreground notification clicked: ${response.payload}");
//         _handleNotificationClick(response.payload);
//       },
//       onDidReceiveBackgroundNotificationResponse: backgroundNotificationHandler,
//     );
//
//     final details = await _flutterLocalNotificationsPlugin
//         .getNotificationAppLaunchDetails();
//     if (details?.didNotificationLaunchApp ?? false) {
//       print("🚀 App launched from notification! Payload: ${details!.notificationResponse?.payload}");
//       _handleNotificationClick(details.notificationResponse?.payload);
//     }
//   }
//
//   void _handleNotificationClick(String? payload) {
//     if (_navigatorKey == null || payload == null) {
//       print("❌ navigatorKey или payload == null");
//       return;
//     }
//
//     print("📌 navigatorKey в момент клика: ${_navigatorKey!.hashCode}");
//     Future.delayed(const Duration(seconds: 2), () {
//       print("📌 navigatorKey.currentState: ${_navigatorKey!.currentState}");
//       if (_navigatorKey!.currentState != null) {
//         _navigatorKey!.currentState!.pushNamed('/newsDetail', arguments: payload);
//       } else {
//         print("❌ navigatorKey!.currentState все еще null");
//       }
//     });
//   }
//
//   Future<void> showNotification({required String newsId}) async {
//     const AndroidNotificationDetails androidDetails =
//     AndroidNotificationDetails(
//       'new_channel',
//       'New Channel Notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//     );
//
//     const NotificationDetails details = NotificationDetails(
//       android: androidDetails,
//     );
//
//     await _flutterLocalNotificationsPlugin.show(
//       0,
//       'Нова новина!',
//       'Перегляньте деталі новини.',
//       details,
//       payload: newsId,
//     );
//   }
// }
//
// @pragma('vm:entry-point')
// void backgroundNotificationHandler(NotificationResponse response) {
//   print("🛑 Background notification clicked: ${response.payload}");
// }

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../navigation/app_router.dart';
import '../navigation/app_router.gr.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() => _instance;

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  late AppRouter _router;

  Future<void> init(AppRouter router) async {
    _router = router;

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("🔔 Уведомление кликнуто: ${response.payload}");
        _handleNotificationClick(response.payload);
      },
      onDidReceiveBackgroundNotificationResponse: backgroundNotificationHandler,
    );

    final details = await _flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails();
    if (details?.didNotificationLaunchApp ?? false) {
      print(
          "🚀 Приложение запущено через уведомление! Payload: ${details!.notificationResponse?.payload}");
      _handleNotificationClick(details.notificationResponse?.payload);
    }
  }

  void _handleNotificationClick(String? payload) {
    if (payload == null) {
      print("❌ Payload == null");
      return;
    }

    print("📌 Переход на экран детали новости с ID: $payload");
    _router.push(NewsDetailRoute(newsId: payload));
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
  print("🛑 Уведомление кликнуто в фоне: ${response.payload}");
}
