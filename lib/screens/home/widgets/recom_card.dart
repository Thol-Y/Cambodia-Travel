import 'package:cambodia_travel/model/recommend.dart';
import 'package:cambodia_travel/screens/Detail/screen_detail.dart';
import 'package:flutter/material.dart';

class RecomCard extends StatelessWidget {
  const RecomCard({
    super.key,
    required this.recommendList,
  });

  final List<Recommend> recommendList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          final recommend = recommendList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(recommend: recommend),
                ),
              );
            },
            child: Container(
              width: 150,
              height: double.infinity,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(recommend.img),
                  fit: BoxFit.cover,
                  opacity: 0.7,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Name
                  Text(
                    recommend.name,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 12,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        recommend.location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Star Ratings and Views
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Star Ratings
                      Row(
                        children: List.generate(4, (index) {
                          return const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.yellowAccent,
                          );
                        })
                          ..add(const Icon(
                            Icons.star_border,
                            size: 10,
                            color: Colors.white,
                          )),
                      ),
                      // Views
                      Row(
                        children: [
                          const Icon(
                            Icons.visibility,
                            size: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '${recommend.views}B',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    );
  }
}
