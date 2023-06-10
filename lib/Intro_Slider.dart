import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Slider',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IntroSlider(),
    );
  }
}

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final List<String> imageList = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    startAutoSlide();
  }

  @override
  void dispose() {
    stopAutoSlide();
    super.dispose();
  }

  void startAutoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      carouselController.nextPage();
      startAutoSlide();
    });
  }

  void stopAutoSlide() {
    carouselController.stopAutoPlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              autoPlay: false,
            ),
            items: imageList.map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex == imageList.length - 1) {
                  Navigator.pop(context);
                } else {
                  carouselController.nextPage();
                }
              },
              child: Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
