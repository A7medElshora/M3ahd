import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m3ahd/About.dart';
import 'package:m3ahd/Screens/WebViews/Acount_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/Screens/WebViews/cart_WebView.dart';
import 'package:m3ahd/galleryPages.dart';
import 'package:m3ahd/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:m3ahd/faq_screen.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with WidgetsBindingObserver {
  late final WebViewController controller;
  var loadingPercentage = 0;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  late DragGesturePullToRefresh dragGesturePullToRefresh;

  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    controller = WebViewController() // Initialize controller first
      ..setBackgroundColor(const Color(0x00000000))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            dragGesturePullToRefresh.started();
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (String url) {
            dragGesturePullToRefresh.finished();
            setState(() {
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {
            dragGesturePullToRefresh.finished();
          },
        ),
      )
      ..loadRequest(
        Uri.parse('https://m3ahd.com/course-categories/'),
      );

    dragGesturePullToRefresh = DragGesturePullToRefresh(3000, 10)
        .setController(controller)
        .setDragHeightEnd(200)
        .setDragStartYDiff(10)
        .setWaitToRestart(3000);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    dragGesturePullToRefresh
        .setDragHeightEnd(MediaQuery.of(context).size.height);
  }

  Future<void> _refresh() async {
    await controller.reload();
  }

  Future<bool> _onWillPop() async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return false; // Stay in app
    } else {
      return true; // Leave app
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff292931),
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.greenAccent),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    child: Wrap(
                      children: <Widget>[
                        ///Home
                        ListTile(
                          leading: Icon(
                            Icons.home_outlined,
                            color: Colors.green,
                          ),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'الرئيسية',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        ),

                        ///Account
                        ListTile(
                          leading: Icon(Icons.account_circle_outlined,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'حسابى',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Acount()),
                            );
                          },
                        ),

                        ///Cart
                        ListTile(
                          leading:
                              Icon(Icons.shopping_cart_outlined, color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'السلة',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Cart()),
                            );
                          },
                        ),

                        ///About
                        ListTile(
                          leading: Icon(Icons.info_outline_rounded,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'عنا',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AboutPage()),
                            );
                          },
                        ),

                        ///Faq
                        ListTile(
                          leading: Icon(Icons.question_mark_outlined,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'FAQ',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => FAQScreen()),
                            );
                          },
                        ),

                        ///Gallery
                        ListTile(
                          leading: Icon(Icons.photo_album_outlined,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'معرض الصور',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Gallery()),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () => _onWillPop(), // Call _onWillPop for go back
          //     icon: Icon(Icons.arrow_circle_left, color: Colors.greenAccent), // Change icon to arrow_back
          //   ),
          // ],
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: Builder(
                builder: (context) {
                  dragGesturePullToRefresh.setContext(context);
                  return WebViewWidget(
                    controller: controller,
                    gestureRecognizers: {
                      Factory(() => dragGesturePullToRefresh)
                    },
                  );
                },
              ),
            ),
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
          ],
        ),
      ),
    );
  }
}
