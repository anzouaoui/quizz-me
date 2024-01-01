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
    apiKey: 'AIzaSyD6z47ERRdVyKzvY0EgIZ91DEzweyHmkWQ',
    appId: '1:977891426731:web:1c13317d32bbb44d3312ee',
    messagingSenderId: '977891426731',
    projectId: 'quizz-me-3a102',
    authDomain: 'quizz-me-3a102.firebaseapp.com',
    storageBucket: 'quizz-me-3a102.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCm1T5BR5SRZSr5ms9SoDkmiPYRS-k143Y',
    appId: '1:977891426731:android:7c3a0b3b1cbba6ef3312ee',
    messagingSenderId: '977891426731',
    projectId: 'quizz-me-3a102',
    storageBucket: 'quizz-me-3a102.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUHZXqlnsYlbRaJ0lNpsuVsWYnksJeT2I',
    appId: '1:977891426731:ios:bb9a9f45b18cc16c3312ee',
    messagingSenderId: '977891426731',
    projectId: 'quizz-me-3a102',
    storageBucket: 'quizz-me-3a102.appspot.com',
    iosBundleId: 'com.example.rcFlQuizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUHZXqlnsYlbRaJ0lNpsuVsWYnksJeT2I',
    appId: '1:977891426731:ios:bb9a9f45b18cc16c3312ee',
    messagingSenderId: '977891426731',
    projectId: 'quizz-me-3a102',
    storageBucket: 'quizz-me-3a102.appspot.com',
    iosBundleId: 'com.example.rcFlQuizApp',
  );
}
