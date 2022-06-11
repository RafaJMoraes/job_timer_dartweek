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
    apiKey: 'AIzaSyAq-198EWW-am2jzdbuhRACnf37K7P3010',
    appId: '1:85483327517:web:65cd1b3cab7cbf680ff6f4',
    messagingSenderId: '85483327517',
    projectId: 'jobtimer-dw',
    authDomain: 'jobtimer-dw.firebaseapp.com',
    storageBucket: 'jobtimer-dw.appspot.com',
    measurementId: 'G-09JVQ0TW09',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHuXjOMoUh_8U6HNsAQi6LB4hXWidcYjo',
    appId: '1:85483327517:android:6110eb6a1a7f83970ff6f4',
    messagingSenderId: '85483327517',
    projectId: 'jobtimer-dw',
    storageBucket: 'jobtimer-dw.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCsZcUuZFz2vxA8jvLDQjEmjCaZS3T5uOg',
    appId: '1:85483327517:ios:4c7dcd4bdb3e8b2b0ff6f4',
    messagingSenderId: '85483327517',
    projectId: 'jobtimer-dw',
    storageBucket: 'jobtimer-dw.appspot.com',
    androidClientId: '85483327517-7lo0ojji5f14sattkuas6s2gr7mql1na.apps.googleusercontent.com',
    iosClientId: '85483327517-u9ah10flve1ofnmlpdvbfib07gisiq9q.apps.googleusercontent.com',
    iosBundleId: 'br.com.ramaluSystens.jobTimer',
  );
}
