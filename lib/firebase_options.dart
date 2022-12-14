// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBF8OHWIPaNpCYWfncNz0hsMjx3FVnEwM4',
    appId: '1:142785329820:web:8ee62d0c22a4cc707e4b59',
    messagingSenderId: '142785329820',
    projectId: 'valorant-tips-flutter-v2',
    authDomain: 'valorant-tips-flutter-v2.firebaseapp.com',
    storageBucket: 'valorant-tips-flutter-v2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBfWRuughIqBPxrcLxbDix_6LOkJcp4fQ',
    appId: '1:142785329820:android:1edc4a626cb9078b7e4b59',
    messagingSenderId: '142785329820',
    projectId: 'valorant-tips-flutter-v2',
    storageBucket: 'valorant-tips-flutter-v2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8XA5mR-ixLlxg_ETBVAA2tQ4k--fuk9E',
    appId: '1:142785329820:ios:de1a8318719ce38f7e4b59',
    messagingSenderId: '142785329820',
    projectId: 'valorant-tips-flutter-v2',
    storageBucket: 'valorant-tips-flutter-v2.appspot.com',
    iosClientId: '142785329820-5jceqlqpc6nijm14glijbbvi62ssl1j4.apps.googleusercontent.com',
    iosBundleId: 'com.example.valoTips',
  );
}
