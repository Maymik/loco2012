// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-wZ-87id5n7X7UfhSyT81jmARjLDwJJk',
    appId: '1:15753221037:web:c75e385409506b09344724',
    messagingSenderId: '15753221037',
    projectId: 'loko2012-47a23',
    authDomain: 'loko2012-47a23.firebaseapp.com',
    storageBucket: 'loko2012-47a23.firebasestorage.app',
    measurementId: 'G-7877QPY5WF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeqox_e5JfGIXrrQATkZp3hheFm7nlv80',
    appId: '1:15753221037:android:e78792db1353d4ce344724',
    messagingSenderId: '15753221037',
    projectId: 'loko2012-47a23',
    storageBucket: 'loko2012-47a23.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3qlr5KXqTM8GeC6VLWDrutL6Shy3Ajd4',
    appId: '1:15753221037:ios:2f4305658aafaf0e344724',
    messagingSenderId: '15753221037',
    projectId: 'loko2012-47a23',
    storageBucket: 'loko2012-47a23.firebasestorage.app',
    iosBundleId: 'com.example.loco2012',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3qlr5KXqTM8GeC6VLWDrutL6Shy3Ajd4',
    appId: '1:15753221037:ios:2f4305658aafaf0e344724',
    messagingSenderId: '15753221037',
    projectId: 'loko2012-47a23',
    storageBucket: 'loko2012-47a23.firebasestorage.app',
    iosBundleId: 'com.example.loco2012',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-wZ-87id5n7X7UfhSyT81jmARjLDwJJk',
    appId: '1:15753221037:web:95fd3c06f01e3c21344724',
    messagingSenderId: '15753221037',
    projectId: 'loko2012-47a23',
    authDomain: 'loko2012-47a23.firebaseapp.com',
    storageBucket: 'loko2012-47a23.firebasestorage.app',
    measurementId: 'G-TQF5EL03R1',
  );
}
