import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:m3ahd/About.dart';
import 'package:m3ahd/Screens/WebViews/Acount_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Categories_WebView.dart';
import 'package:m3ahd/Screens/WebViews/Home_WebView.dart';
import 'package:m3ahd/Screens/WebViews/cart_WebView.dart';
import 'package:m3ahd/faq_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageModel {
  final String imageUrl;
  final String title;
  final String description;
  final int initialRating;

  ImageModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.initialRating,
  });
}

class Gallery extends StatelessWidget {
  final List<ImageModel> imageList = [
    ImageModel(
      imageUrl: 'assets/images/gallery01.png',
      title: 'دورة صيانة أنظمة التبريد والتكييف HVAC',
      description:
          'شرح أهمية التعرف على التقنبات الحديثه لأنظمة الصيانة  الفعالة\n توضيح وتعريف المشاركين بالطرق الحديثه فى إدارة الصيانة والتحسين المستمر...',
      initialRating: 3,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery02.png',
      title: 'دورة نظم المعلومات الجغرافية المتقدمة GIS',
      description:
          'كيفية بناء الطبقات وتنظيم وإنشاء وتحرير البيانات الجغرافية للحفاظ على دقتها وربطها ببياناتها الوصفية.\n الجمع بين البيانات من مصادر مختلفة لإنشاء خرائط دقيقة ومفيدة. ...',
      initialRating: 4,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery03.jpg',
      title: 'دورة الريفيت المعماري Revit Architecture ',
      description:
          'دورة “ريفيت المعماري” تقدم تدريبًا عمليًا للمهندسين والمصممين على استخدام برنامج Autodesk Revit لتصميم المباني بتقنية BIM. \nيشمل البرنامج فهم واستخدام واجهة البرنامج، والرسم ثنائي وثلاثي الأبعاد، وإضافة المكونات إلى نموذج المبنى،\n مما يمكّن المشاركين من تحقيق أهدافهم التصميمية بفاعلية.',
      initialRating: 2,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery04.png',
      title: 'دورة 3Ds MAX العمارة والتصميم الداخلي',
      description:
          'نظرة عامة على الدورة \n \n 3Ds MAX Architecture & Interior Design هو برنامج نمذجة تم إصداره بواسطة Autodesk.\n يوفر البرنامج التقنيات اللازمة لنمذجة وتحريك التصاميم ثلاثية الأبعاد التي يمكن...',
      initialRating: 1,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery05.png',
      title: 'دورة التيار الخفيف – Low Current Course',
      description:
          'دورة التيار الخفيف تقدم فرصة لاكتساب المهارات العملية في تصميم وصيانة أنظمة التيار الخفيف، مثل CCTV، نظم التحكم في الوصول، وأنظمة الإنذار ضد الحرائق.\n يتيح التركيز على محاور متنوعة للمشاركين تحقيق فهم شامل وتطبيق فعّال للتقنيات الحديثة في هذا المجال المتقدم...',
      initialRating: 3,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery06.png',
      title: 'دورة القوى الكهربائية \n',
      description:
          'دورة تطويرية تهدف إلى إكساب المتدرب المعارف والمهارات التأسيسية اللازمة في مجال القوى الكهربائية والتمديدات المنزلية واعتمادا على المعايير المهنية الوطنية لبرنامج القوى الكهربائية...',
      initialRating: 4,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery07.png',
      title: 'دورة تصميم الانظمة الصحية \nPlumbing',
      description:
          ' تهدف الدروة الى \n اعداد المهندسين والكوادر الفنية في مجال الهندسة الميكانيكية على فهم كيفية القيام بأعمال تصميم شبكات الصرف الصحى والتغذية و عمل الحسابات التصميمية الخاصة بهم تزويد المتدرب بالمعرفة الكاملة عن...',
      initialRating: 1,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery08.png',
      title: 'دورة تصميم أنظمة مكافحة الحريق | fire fighting',
      description:
          'يشير مفهوم السلامة من الحرائق: إلى الاحتياطات التي يتم اتخاذها لمنع أو الحد من احتمال وقوع الحريق التي قد تؤدي إلى الوفاة أو الإصابة أو أضرار في الممتلكات، والعمل على تنبيه العاملين في المنشأة إلى وجود حريق في حالة حدوثها بحيث يتمكن العاملين.',
      initialRating: 0,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery09.png',
      title: 'دورة مبادئ التصميم الداخلي',
      description:
          'الدورة تعرض من خلالها كل ما يخص عمليه التصميم من الفكره الى التطبيق مرورا بالملاحظات و الاشتراطات اللازمه لإتمام التصميم ولدخول مجال التصميم الداخلى باحترافيه كامله',
      initialRating: 3,
    ),
    ImageModel(
      imageUrl: 'assets/images/gallery10.png',
      title: 'دورة فوتوشوب Photoshop',
      description:
          'تهدف دورة “فوتوشوب” إلى تطوير مهارات المشتركين في مجال التصميم الداخلي والديكور، حيث تشمل الأهداف التعديل على الصور الرقمية، تصحيح الألوان، وتركيب الصور لإنشاء تصميمات جديدة. يُعنى البرنامج بأساسيات الألوان وتنسيقها في برنامج الفوتوشوب، بالإضافة إلى استخدام مزايا الذكاء الاصطناعي والأشكال الذكية. يُشجع على استخدام الطلاب لأدوات الفرشاة والطبقات وأدوات الاختيار.',
      initialRating: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'SA'),
      supportedLocales: [
        const Locale('ar', 'SA'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(
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

                        ///FAQ
                        ListTile(
                          leading: Icon(
                            Icons.question_mark_outlined,
                            color: Colors.green,
                          ),
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
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => FAQScreen()),
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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.lightGreen, Colors.white],
            ),
          ),
          child: ListView.builder(
            itemCount: (imageList.length / 2).ceil(),
            itemBuilder: (context, index) {
              int startIndex = index * 2;
              int endIndex = startIndex + 2;
              endIndex =
                  endIndex > imageList.length ? imageList.length : endIndex;

              return Row(
                children: [
                  for (int i = startIndex; i < endIndex; i++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImageDetailsPage(imageModel: imageList[i]),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imageList[i].imageUrl,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    imageList[i].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ImageDetailsPage extends StatefulWidget {
  final ImageModel imageModel;

  const ImageDetailsPage({required this.imageModel});

  @override
  _ImageDetailsPageState createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _loadRating(); // Load rating when the widget initializes
  }

  // Function to load the rating from shared preferences
  _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rating = prefs.getInt(widget.imageModel.title) ??
          widget.imageModel.initialRating;
    });
  }

  // Function to save the rating to shared preferences
  _saveRating(int rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(widget.imageModel.title, rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imageModel.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.lightGreen, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                widget.imageModel.imageUrl,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.imageModel.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,fontFamily: 'Cairo',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.imageModel.description,
                      style: TextStyle(fontSize: 19,fontFamily: 'Cairo',),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'قيم الدورة التعليمية:-',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.deepOrange,fontFamily: 'Cairo',),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                          child: Text(
                            "استكشاف",
                            style: TextStyle(
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Cairo',
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        for (int i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = i;
                                _saveRating(i); // Save rating when tapped
                              });
                            },
                            child: Icon(
                              i <= _rating ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
