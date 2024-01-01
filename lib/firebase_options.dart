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
        return macos;
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
    apiKey: 'AIzaSyDHG6m5FUD-vq54FJ7bonzLx5c0Pxj2gtE',
    appId: '1:866442811079:web:b11402b62f8b12ab7190e2',
    messagingSenderId: '866442811079',
    projectId: 'wealthwise-34466',
    authDomain: 'wealthwise-34466.firebaseapp.com',
    storageBucket: 'wealthwise-34466.appspot.com',
    measurementId: 'G-45SW04VMDM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd6s4IBDG4XxtrkAm7oHfwW9smEN93Jyo',
    appId: '1:866442811079:android:63f65325e5831fa37190e2',
    messagingSenderId: '866442811079',
    projectId: 'wealthwise-34466',
    storageBucket: 'wealthwise-34466.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5_YgsUoxenqN8RBFKP4NyDSYQT0VHgUk',
    appId: '1:866442811079:ios:6f3b3ff678e3218c7190e2',
    messagingSenderId: '866442811079',
    projectId: 'wealthwise-34466',
    storageBucket: 'wealthwise-34466.appspot.com',
    iosBundleId: 'com.example.wealthwise',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5_YgsUoxenqN8RBFKP4NyDSYQT0VHgUk',
    appId: '1:866442811079:ios:d00df8f1d75d64357190e2',
    messagingSenderId: '866442811079',
    projectId: 'wealthwise-34466',
    storageBucket: 'wealthwise-34466.appspot.com',
    iosBundleId: 'com.example.wealthwise.RunnerTests',
  );
}
