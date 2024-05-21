import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'main.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifivations() async {
    /// Request permission
    await _firebaseMessaging.requestPermission();
    /// Fetch token
    final fCMToken = await _firebaseMessaging.getToken();
    /// Print Token
    print('Token:- $fCMToken ----');
    initPushNotifications();
  }

  /// Handling Notification message
  void handelMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/splash_screen', // Replace '/splash_screen' with your SplashScreen route name
          (route) => false, // This will remove all routes from the stack and push the SplashScreen
    );
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handelMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handelMessage);
  }
}
