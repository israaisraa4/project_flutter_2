import 'package:flutter/material.dart';
import 'package:project_flutter/app/Drawer/faqs_screen.dart';
import 'package:project_flutter/app/Drawer/favorites_screen.dart' show FavoritesScreen;
import 'package:project_flutter/app/Drawer/frequent_questions_screen.dart';
import 'package:project_flutter/app/Drawer/second_favorites_screen.dart';
import 'package:project_flutter/app/Drawer/third_favorites_screen.dart';
import 'package:project_flutter/app/bottom_navigation_screen.dart';
import 'package:project_flutter/app/categories_screen.dart';
import 'package:project_flutter/app/home_screen.dart';
import 'package:project_flutter/app/users_screen.dart';
import 'package:project_flutter/screens/launch_screen.dart';
import 'package:project_flutter/screens/login_screen.dart';
import 'package:project_flutter/screens/onboarding/onboarding_screen.dart';

import 'app/second_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/launch_screen' ,
      routes: {
        "/launch_screen": (context) => const LaunchScreen(),
        "/on_boarding_screen": (context) => const OnboardingScreen(),
        "/login_screen": (context) => const LoginScreen(),
        "/users_screen": (context) => const UsersScreen(),
        "/categories_screen": (context) => const CategoriesScreen(),
        "/home_screen": (context) => const HomeScreen(),
        "/second_home_screen": (context) => const SecondHomeScreen(),
        "/bottom_navigation_screen": (context) => const BottomNavigationScreen(),
        "/faqs_screen": (context) => const FaqsScreen(),
        "/frequent_questions_screen": (context) => const FrequentQuestionsScreen(),
        "/favorite_screen": (context) => const FavoritesScreen(),
        "/second_favorite_screen": (context) => const SecondFavoritesScreen(),
        "/third_favorites_screen": (context) => const ThirdFavoritesScreen(),

      }
    );
  }
}
