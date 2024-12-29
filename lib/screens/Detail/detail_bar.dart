import 'package:cambodia_travel/model/recommend.dart';
import 'package:cambodia_travel/provider/plan_provider.dart';
import 'package:flutter/material.dart';

class DetailBar extends StatelessWidget {
  const DetailBar({super.key, required this.recommend});

  final Recommend recommend;

  @override
  Widget build(BuildContext context) {
    final provider = PlanProvider.of(context);

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
              provider.toggleplan(recommend); 
            },
            icon: Icon(
              Icons.bookmark,
              size: 20,
              color: provider.isExist(recommend)
                  ? Colors.yellowAccent
                  : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
