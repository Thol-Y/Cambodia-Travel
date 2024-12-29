import 'package:cambodia_travel/model/tourism.dart';
import 'package:cambodia_travel/screens/Detail/tour_detail.dart';
import 'package:flutter/material.dart';

class TourismCart extends StatelessWidget {
  const TourismCart({super.key, required this.tourism});
  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TourismDetail(tourism: tourism),
          ),
        );
      },
      child: Container(
        width: 160, 
        height: 230, 
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(tourism.img),
            fit: BoxFit.cover,
            opacity: 0.6, 
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Tourism name
            Text(
              tourism.nameTour,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 5),
            // Location Row
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 12,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    tourism.location,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Rating and Views Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Star Rating
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < 4 ? Colors.yellow : Colors.white,
                      size: 12,
                    );
                  }),
                ),
                // View count
                Row(
                  children: [
                    const Icon(
                      Icons.visibility,
                      size: 12,
                      color: Colors.white,
                    ),
                    Text(
                      '${tourism.views}B',
                      style: const TextStyle(
                        fontSize: 12,
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
  }
}
