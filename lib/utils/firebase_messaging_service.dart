// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // class FirebaseMessagingService {
// //   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
// //   final FlutterLocalNotificationsPlugin _localNotifications =
// //       FlutterLocalNotificationsPlugin();
// //
// //   Future<void> initNotifications() async {
// //     NotificationSettings settings = await _messaging.requestPermission(
// //       alert: true,
// //       badge: true,
// //       sound: true,
// //     );
// //
// //     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
// //       String? token = await _messaging.getToken();
// //       await saveTokenToFirestore(token);
// //     }
// //
// //     await _initializeLocalNotifications();
// //
// //     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //       print('📩 Получено сообщение в foreground!');
// //
// //       if (message.data.isNotEmpty) {
// //         handleIncomingData(message.data);
// //       }
// //
// //       if (message.notification != null) {
// //         showLocalNotification(message.notification!);
// //       }
// //     });
// //
// //     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
// //       print('📬 Пользователь открыл уведомление!');
// //
// //       if (message.data.isNotEmpty) {
// //         handleIncomingData(message.data);
// //       }
// //     });
// //
// //     FirebaseMessaging.instance
// //         .getInitialMessage()
// //         .then((RemoteMessage? message) {
// //       if (message != null && message.data.isNotEmpty) {
// //         handleIncomingData(message.data);
// //       }
// //     });
// //   }
// //
// //   Future<void> saveTokenToFirestore(String? token) async {
// //     if (token == null) return;
// //
// //     User? user = FirebaseAuth.instance.currentUser;
// //     if (user != null) {
// //       await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
// //         {'fcm_token': token},
// //         SetOptions(merge: true),
// //       );
// //     }
// //   }
// //
// //   Future<void> _initializeLocalNotifications() async {
// //     const AndroidInitializationSettings androidSettings =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //     const InitializationSettings settings = InitializationSettings(
// //       android: androidSettings,
// //     );
// //
// //     await _localNotifications.initialize(settings);
// //   }
// //
// //   Future<void> showLocalNotification(RemoteNotification notification) async {
// //     const AndroidNotificationDetails androidDetails =
// //         AndroidNotificationDetails(
// //       'channel_id',
// //       'Основной канал',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );
// //
// //     const NotificationDetails details =
// //         NotificationDetails(android: androidDetails);
// //
// //     await _localNotifications.show(
// //       0,
// //       notification.title,
// //       notification.body,
// //       details,
// //     );
// //   }
// //
// //   void handleIncomingData(Map<String, dynamic> data) {
// //     print('🔍 Обработка данных: $data');
// //
// //     if (data.containsKey('action')) {
// //       String action = data['action'];
// //       switch (action) {
// //         case 'open_screen':
// //           String? screen = data['screen'];
// //           if (screen != null) {
// //             print('🖥 Открываем экран: $screen');
// //             // TODO: Добавить логику навигации на нужный экран
// //           }
// //           break;
// //         case 'show_alert':
// //           String? message = data['message'];
// //           if (message != null) {
// //             print('⚠️ Показываем алерт: $message');
// //             // TODO: Можно показать AlertDialog или SnackBar
// //           }
// //           break;
// //         default:
// //           print('⚠️ Неизвестное действие: $action');
// //       }
// //     }
// //   }
// // }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class FirebaseMessagingService {
//   static final FirebaseMessagingService _instance =
//       FirebaseMessagingService._internal();
//
//   factory FirebaseMessagingService() => _instance;
//
//   FirebaseMessagingService._internal();
//
//   final FirebaseMessaging _messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//
//   GlobalKey<NavigatorState>? _navigatorKey;
//
//   GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
//
//   Future<void> init(GlobalKey<NavigatorState> navigatorKey) async {
//     _navigatorKey = navigatorKey;
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       String? token = await _messaging.getToken();
//       await _saveTokenToFirestore(token);
//     }
//
//     await _initializeLocalNotifications();
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('📩 Получено сообщение в foreground!');
//
//       if (message.data.isNotEmpty) {
//         _handleIncomingData(message.data);
//       }
//
//       if (message.notification != null) {
//         _showLocalNotification(message.notification!, message.data);
//       }
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('📬 Пользователь открыл уведомление!');
//       if (message.data.isNotEmpty) {
//         _handleIncomingData(message.data);
//       }
//     });
//
//     final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null && initialMessage.data.isNotEmpty) {
//       _handleIncomingData(initialMessage.data);
//     }
//   }
//
//   Future<void> _saveTokenToFirestore(String? token) async {
//     if (token == null) return;
//
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
//         {'fcm_token': token},
//         SetOptions(merge: true),
//       );
//     }
//   }
//
//   Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const InitializationSettings settings = InitializationSettings(
//       android: androidSettings,
//     );
//
//     await _localNotifications.initialize(
//       settings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {
//         print("🔔 Уведомление открыто: ${response.payload}");
//         _handleNotificationClick(response.payload);
//       },
//       onDidReceiveBackgroundNotificationResponse: backgroundNotificationHandler,
//     );
//   }
//
//   Future<void> _showLocalNotification(
//       RemoteNotification notification, Map<String, dynamic> data) async {
//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'channel_id',
//       'Основной канал',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     const NotificationDetails details =
//         NotificationDetails(android: androidDetails);
//
//     await _localNotifications.show(
//       0,
//       notification.title,
//       notification.body,
//       details,
//       payload: data['action'],
//     );
//   }
//
//   void _handleIncomingData(Map<String, dynamic> data) {
//     print('🔍 Обработка данных: $data');
//     if (data.containsKey('action')) {
//       String action = data['action'];
//       switch (action) {
//         case 'open_screen':
//           String? screen = data['screen'];
//           if (screen != null) {
//             print('🖥 Открываем экран: $screen');
//             _handleNotificationClick(screen);
//           }
//           break;
//         case 'show_alert':
//           String? message = data['message'];
//           if (message != null) {
//             print('⚠️ Показываем алерт: $message');
//             // TODO: Показать AlertDialog или SnackBar
//           }
//           break;
//         default:
//           print('⚠️ Неизвестное действие: $action');
//       }
//     }
//   }
//
//   void _handleNotificationClick(String? payload) {
//     if (payload != null && _navigatorKey?.currentState != null) {
//       print('✅ Переход на экран: $payload');
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         _navigatorKey!.currentState!.pushNamed(payload);
//       });
//     }
//   }
// }
//
// @pragma('vm:entry-point')
// void backgroundNotificationHandler(NotificationResponse response) {
//   print("🛑 Уведомление в фоне открыто: ${response.payload}");
// }
