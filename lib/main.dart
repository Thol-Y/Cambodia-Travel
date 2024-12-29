import 'package:cambodia_travel/provider/plan_provider.dart';
import 'package:cambodia_travel/provider/tour_provi.dart';
import 'package:cambodia_travel/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CambodiaTravelApp());
}

class CambodiaTravelApp extends StatelessWidget {
  const CambodiaTravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlanProvider()),
        ChangeNotifierProvider(create: (_) => TourProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFFC46A3A), 
          hintColor: const Color(0xFF6B8E23), 
          scaffoldBackgroundColor: const Color(0xFFF5F5DC), 
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF333333), 
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              color: Color(0xFF666666), 
              fontSize: 16,
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xFFC46A3A), 
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}

