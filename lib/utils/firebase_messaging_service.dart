import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../navigation/app_router.dart';
import '../navigation/app_router.gr.dart';

class PushNotificationService {
  static final PushNotificationService _instance =
      PushNotificationService._internal();

  factory PushNotificationService() => _instance;

  PushNotificationService._internal();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AppRouter? _router;
  String? _pendingPayload;

  Future<void> init(AppRouter router) async {
    _router = router;
    print("📌 Полученный AppRouter: \${_router?.hashCode}");

    await _requestPermissions();
    await _setupLocalNotifications();
    await _setupFCM();
  }

  Future<void> _requestPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print("🔔 Разрешения на уведомления: \${settings.authorizationStatus}");
  }

  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("🔔 Локальное уведомление кликнуто: \${response.payload}");
        _handleNotificationClick(response.payload);
      },
    );
  }

  Future<void> _setupFCM() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("📩 Получено push-уведомление: \${message.data}");
      _showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("🚀 Приложение открыто через уведомление: \${message.data}");
      _handleNotificationClick(message.data['newsId']);
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("🚀 Приложение запущено через уведомление: \${message.data}");
        _handleNotificationClick(message.data['newsId']);
      }
    });
  }

  void _handleNotificationClick(String? payload) {
    if (payload == null) {
      print("❌ Payload == null");
      return;
    }

    if (_router == null) {
      print("🔄 Роутер еще не инициализирован, сохраняем payload: \$payload");
      _pendingPayload = payload;
      return;
    }

    print("📌 Переход на экран детали новости с ID: \$payload");
    try {
      _router!.push(NewsDetailRoute(newsId: payload));
      print("✅ Навигация отправлена в AutoRouter");
    } catch (e) {
      print("❌ Ошибка при переходе: \$e");
    }
  }

  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'push_channel',
      'Push Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails details =
        NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'Новое уведомление',
      message.notification?.body ?? '',
      details,
      payload: message.data['newsId'],
    );
  }
}
