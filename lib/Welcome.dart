import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas_finder/push_provider/push_notification_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gas_finder/Login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //inicializando las push
  runApp(Welcome());
  await Firebase.initializeApp();
  final PushNotification _pushNotification = new PushNotification();
  await _pushNotification.initNotification();
}
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(), // Configuración para iOS
            TargetPlatform.android: CupertinoPageTransitionsBuilder(), // Configuración para Android
          },
        ),
        textTheme: GoogleFonts.senTextTheme(),
      ),
      home: MyCarousel(),
    );
  }
}

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  CarouselController _carouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: slides.length,
              carouselController: _carouselController,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return SlideItem(
                  image: slides[index]['image']!,
                  title: slides[index]['title']!,
                  description: slides[index]['description']!,
                );
              },
              options: CarouselOptions(
                height: 400.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage=index;
                  });
                },
                autoPlay: false,
                viewportFraction: 1.0,
              ),

            ),
            SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: slides.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Color(0xffed3e4d))
                        .withOpacity(currentPage == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    backgroundColor: Color(0xffeebd3d),
                  ),
                  onPressed: () {
                    _goToNextPage(currentPage);
                  },
                  child: Text('Siguiente', style: TextStyle(fontSize: 20)),
                ),
                TextButton(
                  onPressed: () {
                    navigateToScreen(context);
                  },
                  child: Text(
                    'Omitir',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _goToNextPage(int currentPage) {
    print(currentPage);
    print(slides.length);
    if (currentPage+1 == slides.length) {
      navigateToScreen(context);
    }
    _carouselController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void navigateToScreen(BuildContext context) {

    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
          builder: (context) => Login(),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  SlideItem({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Image.asset(
           image,
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(description),
      ],
    );
  }
}

final List<Map<String, String?>> slides = [
  {
    'image': 'assets/welcome/map.png',
    'title': 'Cerca de Ti',
    'description': 'Encuentra Gasolineras cerca',
  },
  {
    'image': 'assets/welcome/money.png',
    'title': 'Ahorra Dinero',
    'description': 'Al encontrar los mejores precios en combustible',
  },
  {
    'image': 'assets/welcome/rating.png',
    'title': 'Evalua',
    'description': 'El servicio brindado en cada estación',
  },
];
