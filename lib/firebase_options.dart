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
    apiKey: 'AIzaSyDpp4o4-sqP15evzTocsajUfEvgRK3M_v4',
    appId: '1:293768741190:web:27ff79ad8846fb4a5fe547',
    messagingSenderId: '293768741190',
    projectId: 'ecommerce-9b3d7',
    authDomain: 'ecommerce-9b3d7.firebaseapp.com',
    storageBucket: 'ecommerce-9b3d7.firebasestorage.app',
    measurementId: 'G-MKF8WYKE0N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAETIXYkBlTUChncNsOP5M6VY1qeWIlcEU',
    appId: '1:293768741190:android:ccc0689309d0ed605fe547',
    messagingSenderId: '293768741190',
    projectId: 'ecommerce-9b3d7',
    storageBucket: 'ecommerce-9b3d7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEMB_k2VV28HM2o1WaCgO6uYl9kvBMgrM',
    appId: '1:293768741190:ios:9ddc669b7808aa885fe547',
    messagingSenderId: '293768741190',
    projectId: 'ecommerce-9b3d7',
    storageBucket: 'ecommerce-9b3d7.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEMB_k2VV28HM2o1WaCgO6uYl9kvBMgrM',
    appId: '1:293768741190:ios:9ddc669b7808aa885fe547',
    messagingSenderId: '293768741190',
    projectId: 'ecommerce-9b3d7',
    storageBucket: 'ecommerce-9b3d7.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpp4o4-sqP15evzTocsajUfEvgRK3M_v4',
    appId: '1:293768741190:web:fb1e5118471f8da85fe547',
    messagingSenderId: '293768741190',
    projectId: 'ecommerce-9b3d7',
    authDomain: 'ecommerce-9b3d7.firebaseapp.com',
    storageBucket: 'ecommerce-9b3d7.firebasestorage.app',
    measurementId: 'G-RFEWJZ8M9M',
  );
}
