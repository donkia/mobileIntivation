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
    apiKey: 'AIzaSyDd_W9mn-35m2wHx78gdGfg1dm-UE6klT0',
    appId: '1:1028886848502:web:f367b0f28d2e1c73005dd7',
    messagingSenderId: '1028886848502',
    projectId: 'wedding-17302',
    authDomain: 'wedding-17302.firebaseapp.com',
    storageBucket: 'wedding-17302.firebasestorage.app',
    measurementId: 'G-DBX7D9WP1N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1CAut0x4sJz0ze06Ja81GvijgTVVKw8I',
    appId: '1:1028886848502:android:9455742fa1224e95005dd7',
    messagingSenderId: '1028886848502',
    projectId: 'wedding-17302',
    storageBucket: 'wedding-17302.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4AhGEOtqUbqAmcKvz5_DHaAtuyEgonJ0',
    appId: '1:1028886848502:ios:8fa60be39eb5297e005dd7',
    messagingSenderId: '1028886848502',
    projectId: 'wedding-17302',
    storageBucket: 'wedding-17302.firebasestorage.app',
    iosBundleId: 'com.example.mobileInvitation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4AhGEOtqUbqAmcKvz5_DHaAtuyEgonJ0',
    appId: '1:1028886848502:ios:8fa60be39eb5297e005dd7',
    messagingSenderId: '1028886848502',
    projectId: 'wedding-17302',
    storageBucket: 'wedding-17302.firebasestorage.app',
    iosBundleId: 'com.example.mobileInvitation',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDd_W9mn-35m2wHx78gdGfg1dm-UE6klT0',
    appId: '1:1028886848502:web:92f3be44129e3126005dd7',
    messagingSenderId: '1028886848502',
    projectId: 'wedding-17302',
    authDomain: 'wedding-17302.firebaseapp.com',
    storageBucket: 'wedding-17302.firebasestorage.app',
    measurementId: 'G-8VK1CYV5EG',
  );

}