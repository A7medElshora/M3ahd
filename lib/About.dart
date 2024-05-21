import 'package:flutter/material.dart';
import 'package:m3ahd/Screens/WebViews/Acount_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Categories_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/Screens/WebViews/cart_WebView.dart';
import 'faq_screen.dart';
import 'galleryPages.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        ),

                        ///Category
                        ListTile(
                          leading: Icon(Icons.category_outlined,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'فئات',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Categories()),
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
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Cart()),
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
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
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
                          leading: Icon(Icons.browse_gallery_outlined,
                              color: Colors.green),
                          title: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'معرض الصور',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(
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
          //     onPressed: () {
          //       if (Navigator.of(context).canPop()) {clea
          //         Navigator.of(context).pop();
          //       }
          //     },
          //     icon: Icon(Icons.arrow_back, color: Colors.greenAccent),
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: _animation,
                  child: Image.asset(
                    'assets/images/m3hd.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'معاهد.كوم',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,fontFamily: 'Cairo',
                        color: Colors.green),
                  ),
                ),
                SizedBox(height: 20),
                FadeTransition(
                  opacity: _animation,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 9, 0),
                    child: Column(
                      children: [
                        Text(
                          'موقع "معهد" هو منصة تعليمية تهدف إلى تقديم دورات تعليمية متنوعة في مختلف المجالات، سواء كانت تقنية أو إدارية أو فنية، لتلبية احتياجات الطلاب والمهتمين بتطوير مهاراتهم ومعرفتهم في مجالات مختلفة. يقدم الموقع محتوى غنياً ومتنوعاً من الدورات التعليمية التي تشمل شروحات مفصلة وتطبيقات عملية تساعد الطلاب على فهم المفاهيم بشكل أفضل وتطبيقها في الواقع.',
                          style: TextStyle(fontSize: 18.0,fontFamily: 'Cairo',),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'بفضل فريق التدريس المؤهل والمتميز الذي يقدم الدورات، يضمن معهد جودة المحتوى التعليمي وفاعليته في تحقيق الأهداف التعليمية للطلاب. كما يوفر الموقع بيئة تعليمية مريحة وسهلة الاستخدام، تمكّن الطلاب من الوصول إلى المواد التعليمية بسهولة ويسر، سواء كانوا يستخدمون أجهزة الكمبيوتر أو الهواتف الذكية.',
                          style: TextStyle(fontSize: 18.0,fontFamily: 'Cairo',),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'بالإضافة إلى ذلك، يوفر موقع "معهد" خدمات مساندة للطلاب تشمل دعم فني ومنصة تفاعلية للتواصل مع المدرسين والزملاء لمناقشة المواضيع التعليمية وتبادل الخبرات. كما يتيح الموقع فرصًا للتقييم والتقدم بالاختبارات والحصول على شهادات معتمدة تعزز مسار التعلم وتسهم في تطوير مسار المهني.',
                          style: TextStyle(fontSize: 18.0,fontFamily: 'Cairo',),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'باختصار، يُعتبر موقع "معهد" وجهة موثوقة وموفرة للتعلم عبر الإنترنت، حيث يمكن للأفراد من جميع الفئات العمرية والخلفيات الاستفادة من المواد التعليمية عالية الجودة وبناء مهاراتهم ومعرفتهم في مختلف المجالات.',
                          style: TextStyle(fontSize: 18.0,fontFamily: 'Cairo',),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 70,
                        ),
                      ],
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
