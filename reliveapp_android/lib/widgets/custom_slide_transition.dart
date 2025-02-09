import 'package:flutter/material.dart';
import '../screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/splash_screen.dart';

void navigateTo(BuildContext context, String routeName) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return _getScreen(routeName);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}

Widget _getScreen(String routeName) {
  switch (routeName) {
    case '/onboarding':
      return const OnboardingScreen();
    case '/home':
      return const HomeScreen();
    case '/profile':
      return ProfileScreen();
    default:
      return const SplashScreen();
  }
}
