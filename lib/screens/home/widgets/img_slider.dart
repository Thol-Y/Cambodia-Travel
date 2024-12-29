import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImgSlider extends StatefulWidget {
  const ImgSlider({super.key});

  @override
  State<ImgSlider> createState() => _ImgSliderState();
}

class _ImgSliderState extends State<ImgSlider> {
  final List<String> imgList = [
    'images/slider1.jpg',
    'images/slider2.jpg',
    'images/slider3.jpg',
    'images/slider4.jpg',
    'images/slider5.jpg',
    'images/slider6.jpg',
    'images/slider7.jpg',
  ];

  int currentImg = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            height: 150,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                currentImg = index;
              });
            },
          ),
          items: imgList.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                currentImg = entry.key;
              }),
              child: Container(
                width: 7.0,
                height: 7.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentImg == entry.key
                      ? Colors.blueAccent
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
