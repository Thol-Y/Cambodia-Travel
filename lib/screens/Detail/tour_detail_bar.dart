import 'package:cambodia_travel/model/tourism.dart';
import 'package:cambodia_travel/provider/tour_provi.dart';
import 'package:flutter/material.dart';

class TourDetailBar extends StatelessWidget {
  const TourDetailBar({super.key, required this.tourism, });

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    final provider = TourProvider.of(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Back Icon
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          // Share Icon
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Icons.share,
              size: 20,
              color: Colors.white,
            ),
          ),
          // Save Icon
          IconButton(
            onPressed: () {
              provider.toggleplans(tourism); 
            },
            icon: Icon(
              Icons.bookmark,
              size: 20,
              color: provider.isExists(tourism)
                  ? Colors.yellowAccent
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
