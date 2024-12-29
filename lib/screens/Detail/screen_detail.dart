import 'package:cambodia_travel/model/recommend.dart';
import 'package:cambodia_travel/screens/Detail/detail_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.recommend,
  });

  final Recommend recommend;

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
                      recommend.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: DetailBar(recommend: recommend),
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
                    
                    Text(
                      recommend.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 24, 
                          ),
                          const SizedBox(width: 8),
                          
                          Expanded(
                            child: Text(
                              recommend.location,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              maxLines: 2, 
                              overflow: TextOverflow.ellipsis, 
                              textAlign: TextAlign.justify, 
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    
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
                              "${recommend.views} B",
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
                    // Description section
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16), 
                    Text(
                      recommend.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5, 
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20), 
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
