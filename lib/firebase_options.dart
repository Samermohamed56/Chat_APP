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
    apiKey: 'AIzaSyBdtv9uaaPFZnUNhIyJg2HFtfJDBCbtX10',
    appId: '1:518399916493:web:e483f620f3228f226c6c84',
    messagingSenderId: '518399916493',
    projectId: 'chat-app-3d266',
    authDomain: 'chat-app-3d266.firebaseapp.com',
    storageBucket: 'chat-app-3d266.appspot.com',
    measurementId: 'G-48E8B4EBCH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxIoeUQfdl8_k8axJkYgM6hJI9c-_LZlY',
    appId: '1:518399916493:android:8575d86132ac4f776c6c84',
    messagingSenderId: '518399916493',
    projectId: 'chat-app-3d266',
    storageBucket: 'chat-app-3d266.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB341OqgRBE-R1bPAvEzu1pgYqesm10FDk',
    appId: '1:518399916493:ios:141db5e79e55eb956c6c84',
    messagingSenderId: '518399916493',
    projectId: 'chat-app-3d266',
    storageBucket: 'chat-app-3d266.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB341OqgRBE-R1bPAvEzu1pgYqesm10FDk',
    appId: '1:518399916493:ios:141db5e79e55eb956c6c84',
    messagingSenderId: '518399916493',
    projectId: 'chat-app-3d266',
    storageBucket: 'chat-app-3d266.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdtv9uaaPFZnUNhIyJg2HFtfJDBCbtX10',
    appId: '1:518399916493:web:d75340b2d68e4d096c6c84',
    messagingSenderId: '518399916493',
    projectId: 'chat-app-3d266',
    authDomain: 'chat-app-3d266.firebaseapp.com',
    storageBucket: 'chat-app-3d266.appspot.com',
    measurementId: 'G-X90T2ZEEFX',
  );
}
