import 'package:cambodia_travel/screens/home/home_screen.dart';
import 'package:cambodia_travel/screens/plans/plan.dart';
import 'package:cambodia_travel/screens/profile/profile.dart';
import 'package:cambodia_travel/screens/service/service.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  List screen = const [
    HomeScreen(),
    Service(),
    Planning(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              icon: Icon(
                Icons.home,
                size: 30,
                color: currentIndex == 0 ? Colors.red[500] : Colors.grey[500],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              icon: Icon(
                Icons.airport_shuttle,
                size: 30,
                color: currentIndex == 1 ? Colors.red[500] : Colors.grey[500],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              icon: Icon(
                Icons.note_alt,
                size: 30,
                color: currentIndex == 2 ? Colors.red[500] : Colors.grey[500],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              icon: Icon(
                Icons.person,
                size: 30,
                color: currentIndex == 3 ? Colors.red[500] : Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      body: screen[currentIndex],
    );
  }
}
