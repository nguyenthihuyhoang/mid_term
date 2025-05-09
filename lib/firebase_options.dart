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
    apiKey: 'AIzaSyA1oRHfSK8vgTHrVC1SNlGnS7LjrUk9LoY',
    appId: '1:175641669769:web:90b532de387a5bbc22d658',
    messagingSenderId: '175641669769',
    projectId: 'fir-ff754',
    authDomain: 'fir-ff754.firebaseapp.com',
    databaseURL: 'https://fir-ff754-default-rtdb.firebaseio.com',
    storageBucket: 'fir-ff754.appspot.com',
    measurementId: 'G-GK98V1VZGV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDr3v-6sdEG6B3RFL0lPbMSM8yNL26nAUU',
    appId: '1:175641669769:android:dc95b5a3a2579b6e22d658',
    messagingSenderId: '175641669769',
    projectId: 'fir-ff754',
    databaseURL: 'https://fir-ff754-default-rtdb.firebaseio.com',
    storageBucket: 'fir-ff754.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyCrmo3uKYeYvJOpQnwSHf7nFZnk4a2bU',
    appId: '1:175641669769:ios:5553b7089dbfffca22d658',
    messagingSenderId: '175641669769',
    projectId: 'fir-ff754',
    databaseURL: 'https://fir-ff754-default-rtdb.firebaseio.com',
    storageBucket: 'fir-ff754.appspot.com',
    iosBundleId: 'com.example.midTerm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyCrmo3uKYeYvJOpQnwSHf7nFZnk4a2bU',
    appId: '1:175641669769:ios:5553b7089dbfffca22d658',
    messagingSenderId: '175641669769',
    projectId: 'fir-ff754',
    databaseURL: 'https://fir-ff754-default-rtdb.firebaseio.com',
    storageBucket: 'fir-ff754.appspot.com',
    iosBundleId: 'com.example.midTerm',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1oRHfSK8vgTHrVC1SNlGnS7LjrUk9LoY',
    appId: '1:175641669769:web:b5ee91c9cb74c1d622d658',
    messagingSenderId: '175641669769',
    projectId: 'fir-ff754',
    authDomain: 'fir-ff754.firebaseapp.com',
    databaseURL: 'https://fir-ff754-default-rtdb.firebaseio.com',
    storageBucket: 'fir-ff754.appspot.com',
    measurementId: 'G-3H7VQEF1TX',
  );
}
