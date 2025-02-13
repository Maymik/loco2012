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
    print("📌 Полученный AppRouter: ${_router?.hashCode}");

    if (_pendingPayload != null) {
      print("🚀 Обрабатываем отложенный payload: $_pendingPayload");
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

    if (_router == null) {
      print("🔄 Роутер еще не инициализирован, сохраняем payload: $payload");
      _pendingPayload = payload;
      return;
    }

    print("📌 Переход на экран детали новости с ID: $payload");
    try {
      print("📌 Навигационный стек перед push: ${_router!.stack}");
      print("📌 Навигационный стек перед push: $_router");
      // if (_router!.navigatorKey.currentState?.mounted ?? false) {
      //   _router!.replace(NewsDetailRoute(newsId: payload));
      // } else {
      //   print("⏳ Навигация отложена, приложение еще не готово.");
      //   _pendingPayload = payload;
      // }
      // _router!.navigateNamed('/newsDetail/$payload');

      _router!.push(
        const NewsRoute(),
      );
      print("✅ Навигационный стек после push: ${_router!.stack}");
      print("✅ Навигация отправлена в AutoRouter");
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
