import 'package:cambodia_travel/model/recommend.dart';
import 'package:cambodia_travel/model/tourism.dart';
import 'package:cambodia_travel/screens/home/widgets/img_slider.dart';
import 'package:cambodia_travel/screens/home/widgets/recom_card.dart';
import 'package:cambodia_travel/screens/home/widgets/search.dart';
import 'package:cambodia_travel/screens/home/widgets/tourism.dart';
import 'package:flutter/material.dart';

import '../../model/province.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Tourism>> sellectProvince = [
      cambodia,
      pp,
      tk,
      sr,
      kep,
      kp,
      kk,
      shn,
      btb,
      btmc,
      kpc,
      kpcn,
      kps,
      kpt,
      kd,
      kt,
      mdkr,
      pvh,
      pr,
      ps,
      rtnkr,
      st,
      svr,
      odmc,
      tb,
      pl,
    ];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Cambodia Travel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  // Notifications Icon
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                      onPressed: () {},
                      iconSize: 20,
                      icon: const Icon(Icons.notifications_outlined),
                    ),
                  ),
                ],
              ),
              // Search Bar
              const ReSearchBar(),
              const SizedBox(height: 10),
              // Image Slider
              const ImgSlider(),
              const SizedBox(height: 10),
              // Provinces Section
              const Text(
                'Provinces',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 88,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: province.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectIndex == index
                                ? Colors.blue[300]
                                : Colors.transparent),
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(province[index].img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              province[index].name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              
              const Text(
                'Recommend',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              RecomCard(recommendList: recommend),
              const SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tourism',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Tourism Grid
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: sellectProvince[selectIndex].length,
                itemBuilder: (context, index) {
                  return TourismCart(
                    tourism: sellectProvince[selectIndex][index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
