import 'package:flutter/material.dart';
import 'package:m3ahd/Splash.dart';

class NoConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView( // Ensures content scrolls on small screens
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Adjust top padding
                Image.asset(
                  "assets/images/wifi.png",
                  height: MediaQuery.of(context).size.height * 0.25, // Responsive image size
                ),
                SizedBox(height: 20.0),
                Text(
                  'لا يوجد اتصال بالإنترنت',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0, // Adjust font size based on screen size
                    fontWeight: FontWeight.bold,fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center, // Center text
                ),
                SizedBox(height: 10.0),
                Text(
                  "تحقق من الاتصال وحاول مرة أخرى",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'Cairo',
                  ),
                  textAlign: TextAlign.center, // Center text
                ),
                SizedBox(height: 20.0),
                Padding(padding: EdgeInsets.only(top: 180),
                child: ElevatedButton( // Use ElevatedButton for a professional look
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()),
                  ),
                  child: Text(
                    'إعادة المحاولة',
                    style: TextStyle(color: Colors.white, fontSize: 16.0,fontFamily: 'Cairo',),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700], // Adjust button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0), // Adjust button padding
                  ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
