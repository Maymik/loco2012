import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../navigation/app_router.dart';
import '../navigation/app_router.gr.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AppRouter? _router;
  String? _pendingPayload;

  Future<void> init(AppRouter router) async {
    _router = router;

    if (_pendingPayload != null) {
      _handleNotificationClick(_pendingPayload);
      _pendingPayload = null;
    }

    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
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
      return;
    }

    if (_router == null) {
      _pendingPayload = payload;
      return;
    }

    try {
      _router!.push(
        NewsDetailRoute(newsId: payload),
      );
    } catch (e) {
      print("❌ Ошибка при переходе: $e");
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

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      'Новая новость!',
      'Посмотрите детали новости.',
      details,
      payload: newsId,
    );
  }
}

@pragma('vm:entry-point')
void backgroundNotificationHandler(NotificationResponse response) {
  print("🛑 Уведомление кликнуто в фоне: ${response.payload}");
}
