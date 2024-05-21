import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:m3ahd/Splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:m3ahd/conections.dart';
import 'package:m3ahd/firebase_api.dart';
import 'package:m3ahd/firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
bool _firebaseInitialized = false;

Future<void> initializeFirebase() async {
  if (Firebase.apps.isEmpty) {
    print("Initializing Firebase...");
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    print("Firebase initialized.");
    _firebaseInitialized = true;
  } else {
    print("Firebase is already initialized.");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  await FirebaseApi().initNotifivations();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isConnected;
  bool _isCheckingConnection = true;

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity();
  }

  Future<void> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
      _isCheckingConnection = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isCheckingConnection) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: DevicePreview.appBuilder(context, child),
        );
      },
      navigatorKey: navigatorKey,
      home: isConnected ? SplashScreen() : NoConnectionPage(),
      routes: {
        '/splash_screen': (context) => SplashScreen(),
      },
    );
  }
}
