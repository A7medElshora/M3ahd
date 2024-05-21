import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/noti_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentPage = 0;
  late SharedPreferences _prefs;
  late NotidicationService _notificationService; // Initialize the notification service

  final List<String> _titles = [
    "تعلَّم مهارات جديدة",
    "الدورات",
    "الشهادات",
  ];

  final List<String> _descriptions = [
    "يمكنك الآن دراسة كل الدورات التي تريدها\n دون الحاجة للسفر ",
    " تعلم كل ماتحتاجه فى جميع المجالات\n كل ماتحتاجه للتأهيل لسوق العمل ",
    "بعد انتهائك من الدورة تكون جاهزا لدخول الامتحان النهائي للتقييم\nومن ثمَّ الحصول على الشهادة النهائية \n جميع الشهادات معتمدة من الجهات الرسمية ",
  ];

  final List<String> _lottieFiles = [
    'assets/images/welcome.json',
    'assets/images/learn.json',
    'assets/images/cer.json',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );
    _initSharedPreferences();
    _notificationService = NotidicationService(); // Initialize the notification service
    _notificationService.initNotification(); // Initialize notification settings
  }

  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    bool done = _prefs.getBool('done') ?? false;
    bool skip = _prefs.getBool('skip') ?? false;

    if (done || skip) {
      // If 'Done' or 'Skip' is true, navigate directly to WebViewApp
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _titles.length,
              itemBuilder: (context, index) {
                return _buildPage(index);
              },
            ),
            _buildSkipButton(),
            _buildPageIndicator(),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _animationController.reset();
      _animationController.forward();
    });
  }

  Widget _buildPage(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: _buildLottieAnimation(index),
          ),
        ),
        SizedBox(height: 24.0),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: _buildTextContent(index),
          ),
        ),
        SizedBox(height: 20),
        _buildActionButton(index),
      ],
    );
  }

  Widget _buildActionButton(int index) {
    if (index < _titles.length - 1) {
      return Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 15),
              child: ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'التالي',
                  style: TextStyle(color: Colors.white,fontFamily: 'Cairo',),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: ElevatedButton(
                onPressed: () {
                  _prefs.setBool('done', true);
                  _notificationService.ShowNotification(
                      title: "معاهد كوم", body: "مرحبا بكم فى معاهد كوم .. \n تعلَّم الجديد والأفضل "); // Show the welcome notification
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'تم',
                  style: TextStyle(color: Colors.white,fontFamily: 'Cairo',),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildLottieAnimation(int index) {
    return Center(
      child: Lottie.asset(
        _lottieFiles[index],
        controller: index == 0 ? null : _animationController,
      ),
    );
  }

  Widget _buildTextContent(int index) {
    return Column(
      children: [
        Text(
          _titles[index],
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12.0),
        Text(
          _descriptions[index],
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            fontFamily: 'Cairo',
          ),
        ),
        SizedBox(height: 60),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          _titles.length,
              (index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.lightGreen : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () async {
              await _prefs.setBool('skip', true);
              _notificationService.ShowNotification(
                  title: "معاهد كوم", body: "مرحبا بكم فى معاهد كوم .. \n تعلَّم الجديد والأفضل "); // Show the welcome notification
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Text(
              "تخطي",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen,
                fontFamily: 'Cairo',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
