import 'package:cambodia_travel/screens/home/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              'images/welcome.jpg', 
              fit: BoxFit.cover, 
            ),
          ),
         
          Positioned.fill(
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), 
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),
              // Title
              const Text(
                'Wellcome To',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const Text('Cambodia Travel',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )),
              const SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                    'Explore the rich history, ancient temples, and vibrant culture of Cambodia. Discover iconic landmarks, plan your journey, and experience the beauty of Cambodia like never before.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    )),
              ),
              const SizedBox(height: 60),
              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 132, 105, 38),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
