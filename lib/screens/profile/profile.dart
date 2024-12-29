import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Profile'),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Cover Image
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'images/sr.jpg', // Replace with the actual cover image asset
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      'images/sr.jpg', // Replace with the actual profile image asset
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // User name
                  const Text(
                    'Skye Silva',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // User handle
                  const Text(
                    '@shotbyskye',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Bio or description
                  const SingleChildScrollView(
                    child: Text(
                      'Hi I\'m Skye! ✨ Lisbon, Portugal based 📍 Travel + drone videographer ✈️ Follow my adventures!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Follow and Message buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement follow functionality
                        },
                        child: const Text('Follow'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Implement message functionality
                        },
                        child: const Icon(Icons.mail),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Followers and Following
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '204',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text(
                            '1.2M',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Achievements
                  const ListTile(
                    title: Text(
                      'Achievements',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Visited 50 countries, Drone Photographer of the Year 2023'),
                  ),
                  const Divider(),
                  // Photo Gallery
                  const ListTile(
                    title: Text(
                      'Photo Gallery',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Image.asset('images/sr.jpg', fit: BoxFit.cover), // Replace with actual image assets
                      Image.asset('images/sr.jpg', fit: BoxFit.cover),
                      Image.asset('images/sr.jpg', fit: BoxFit.cover),
                      Image.asset('images/sr.jpg', fit: BoxFit.cover),
                    ],
                  ),
                  const Divider(),
                  // Travel Itineraries
                  const ListTile(
                    title: Text(
                      'Travel Itineraries',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Explore my detailed travel itineraries and tips for each destination.'),
                  ),
                  const Divider(),
                  // User Reviews
                  const ListTile(
                    title: Text(
                      'User Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('4.8 out of 5 stars (based on 250 reviews)'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text('Great content! Very informative and engaging.'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text('Loved the travel tips!'),
                  ),
                  const Divider(),
                  // Contact Information
                  const ListTile(
                    title: Text(
                      'Contact',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Email: skye.silva@example.com\nInstagram: @shotbyskye'),
                  ),
                  const Divider(),
                  // Personal Interests
                  const ListTile(
                    title: Text(
                      'Personal Interests',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text('Photography, Hiking, Surfing, Reading'),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}


