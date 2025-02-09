import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Screens
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/home_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/impact_tracking_screen.dart';
import 'screens/learning_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/stats_screen.dart';
import 'screens/quiz_screen.dart';

// Utilities
import 'utils/theme.dart';
import 'utils/constants.dart';

// Providers
import 'providers/user_provider.dart';
import 'providers/wallet_provider.dart';
import 'providers/impact_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
    runApp(const ReliveApp());
  } catch (e) {
    runApp(FirebaseErrorApp(errorMessage: e.toString()));
  }
}

class ReliveApp extends StatelessWidget {
  const ReliveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
        ChangeNotifierProvider(create: (_) => ImpactProvider()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: AppConstants.splashScreenRoute,
        routes: {
          AppConstants.splashScreenRoute: (context) => const SplashScreen(),
          AppConstants.onboardingRoute: (context) => const OnboardingScreen(),
          AppConstants.homeScreenRoute: (context) => const HomeScreen(),
          '/wallet': (context) => const WalletScreen(),
          '/impact': (context) => const ImpactTrackingScreen(),
          '/learning': (context) => LearningScreen(),
          '/profile': (context) => ProfileScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/stats': (context) => StatsScreen(),
          '/quiz': (context) => const QuizScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class FirebaseErrorApp extends StatelessWidget {
  final String errorMessage;

  const FirebaseErrorApp({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Failed to initialize Firebase: \n$errorMessage',
              style: const TextStyle(fontSize: 18, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}