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
    apiKey: 'AIzaSyA2qQvia3geTbEW0sz3UdusEf229uBNTHA',
    appId: '1:578203458920:web:0e207f8b7c400a79b6cadd',
    messagingSenderId: '578203458920',
    projectId: 'udemysocialapp-51367',
    authDomain: 'udemysocialapp-51367.firebaseapp.com',
    storageBucket: 'udemysocialapp-51367.appspot.com',
    measurementId: 'G-42LKVZT62E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7HZVSzmSAHrTsdP5700PDZMwjd8bn1mY',
    appId: '1:578203458920:android:534e85840a4d4c08b6cadd',
    messagingSenderId: '578203458920',
    projectId: 'udemysocialapp-51367',
    storageBucket: 'udemysocialapp-51367.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC72Wi_jXguevo98Evw2KYtu8Z-fwEqdpY',
    appId: '1:578203458920:ios:b5ad4044284a50c8b6cadd',
    messagingSenderId: '578203458920',
    projectId: 'udemysocialapp-51367',
    storageBucket: 'udemysocialapp-51367.appspot.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC72Wi_jXguevo98Evw2KYtu8Z-fwEqdpY',
    appId: '1:578203458920:ios:71f94a95313010f6b6cadd',
    messagingSenderId: '578203458920',
    projectId: 'udemysocialapp-51367',
    storageBucket: 'udemysocialapp-51367.appspot.com',
    iosBundleId: 'com.example.socialApp.RunnerTests',
  );
}
