import 'package:flutter/material.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/About.dart';
import 'package:m3ahd/Screens/WebViews/Acount_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Categories_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/Screens/WebViews/cart_WebView.dart';
import 'package:m3ahd/galleryPages.dart';

// Data model for FAQ items
class FAQItem {
  final String question;
  final String answer;

  FAQItem(this.question, this.answer);
}

// FAQ screen widget
class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqs = [
    FAQItem(
      "ما هي معاهد كوم ؟",
      "معاهد كومهي منصة للتعلم عن بعد \n تتيح للمستخدم فرصة معرفة وتعلم مهارات جديدة مناسبة على اعلى مستوى \n وت}هله لسوق العمل . ",
    ),
    FAQItem(
      "هل احتاج لشهادات معينه للدراسة بها ؟",
      "بالطبع لا ..\nلا تحتاج الى اي شهادات او خبرات سابقة لدراسة اى محتوى جديد \n فنحن نتولى تعليمك وتدريبك من الصفر الى الاحتراف حتيى تبرع فيها بالكامل .",
    ),
    FAQItem(
      "ماهى المجالات الاكثر شهرة ؟!",
      "يمكنك ان تدرس كل المجالات التى ترغب بها مثل مجالات البرمجه بكافة افرعها \n والمعمار والشبكات والمحاسبة والتسويق واللغات وغيرها ...",
    ),
    FAQItem(
      "هل الشهادات معتمدة ؟",
      "بالطبع..\n فجميع الشاهادات التي يحصل عليها الطلاب الذين اتموا دوراتهم التعليمية موثوقة ومعتمدة من جهات رسمية فىالدولة وخارجها .",
    ),
    FAQItem(
      "ما مدى كفاءة المعلمين ؟",
      "يتمتع المعيدين والمعلمين لدينابكفاءة عالية جدا \n حيث يتم اختيارهم بعناية فائقة \n كما ان لهم خبرات كبيرة فى مجالاتهم ومشهود لهمبحسن لاالخلق والدرجة العلمية الرفيعة والاساس فى اختيارهم هو الدقة والخبرة فى العمل .",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAQ",
          style: TextStyle(color: Colors.cyanAccent,fontFamily: 'Cairo',),
        ),
        centerTitle: true,
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
                        leading:
                            Icon(Icons.category_outlined, color: Colors.green),
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
                        leading: Icon(Icons.shopping_cart_outlined, color: Colors.green),
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
                                fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                      ),
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
                                fontWeight: FontWeight.bold,fontFamily: 'Cairo',),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Gallery()),
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
      ),
      body: Center(
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final FAQItem faq = faqs[index];
            return Column(
              children: [
                SizedBox(
                    height: 30), // Add 30 units of space before each question
                ExpansionTile(
                  title: Text(faq.question),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        faq.answer,
                        style: TextStyle(
                          color: Colors.white,fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Divider(color: Colors.grey),
              ],
            );
          },
        ),
      ),
    );
  }
}
