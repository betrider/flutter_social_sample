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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrEMu1EahUTC8iv4Z1DBNRl5ggDsVsPCw',
    appId: '1:868308849637:android:5c5d1465185f5c1ce8550c',
    messagingSenderId: '868308849637',
    projectId: 'flutter-social-login-sam-50272',
    storageBucket: 'flutter-social-login-sam-50272.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCv-4eoxP64up91YDpW2Uq5euySLqdANnQ',
    appId: '1:868308849637:ios:3174b14af6a93ef7e8550c',
    messagingSenderId: '868308849637',
    projectId: 'flutter-social-login-sam-50272',
    storageBucket: 'flutter-social-login-sam-50272.appspot.com',
    androidClientId: '868308849637-5s83l69nlkshibgm9tl9m1029aht1ctk.apps.googleusercontent.com',
    iosClientId: '868308849637-8a581l3q1s3u854q19bvp9bib1k7b2ri.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterSocialSample',
  );
}
