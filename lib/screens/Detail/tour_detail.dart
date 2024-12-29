import 'package:cambodia_travel/model/tourism.dart';
import 'package:cambodia_travel/screens/Detail/tour_detail_bar.dart';
import 'package:flutter/material.dart';

class TourismDetail extends StatelessWidget {
  const TourismDetail({
    super.key, required this.tourism,
    
  });

  final Tourism tourism;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Stack(
                children: [
                  SizedBox(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      tourism.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: TourDetailBar(tourism: tourism),
                  ),
                ],
              ),
             
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    Text(
                      tourism.nameTour,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.redAccent),
                        Text(
                          tourism.location,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Ratings and Views
                    Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow,
                          ),
                        ),
                        const Icon(
                          Icons.star_border,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              size: 16,
                              color: Colors.black54,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${tourism.views} B",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Description Title
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                   
                    Text(
                      tourism.decoration,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
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
