import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:m3ahd/Onboardings.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'conections.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  double _alignment = 1.0;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDone = prefs.getBool('isDone') ?? false;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // If no internet connection, navigate to NoConnectionPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NoConnectionPage()),
      );
    } else if (isDone) {
      // If user is logged in, navigate directly to WebViewApp
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()), // Check if this route is correct
      );
    } else {
      // Delay the animation
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _opacity = 1.0;
          _alignment = 0.0;
        });
      });

      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen[100]!, // Light green color
              Colors.white, // White color
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                    border: Border.all(), // Border color and width
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Same value as above for consistency
                    child: Image.asset(
                      'assets/images/spl.jfif',
                      // width: 500,
                      // height: 500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );



  }
}
