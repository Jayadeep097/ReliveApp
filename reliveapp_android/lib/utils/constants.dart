class AppConstants {
  // App Information
  static const String appName = 'Relive App';
  static const String defaultProfileImage = 'assets/images/default_profile.png';

  // Padding and Spacing
  static const double defaultPadding = 16.0;

  // Routes for Navigation
  static const String splashScreenRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String homeScreenRoute = '/home';
  static const String profileRoute = '/profile';
  static const String walletRoute = '/wallet';
  static const String impactRoute = '/impact';
  static const String learningRoute = '/learning';
  static const String statsRoute = '/stats';
  static const String quizRoute = '/quiz';

  // Theme Constants
  static const String primaryFont = 'Roboto'; // Example primary font
  static const String secondaryFont = 'OpenSans'; // Example secondary font
  static const double buttonCornerRadius = 8.0;
  static const double cardElevation = 4.0;

  // API Endpoints (if needed)
  static const String firebaseBaseUrl = 'https://your-firebase-app.firebaseio.com/';
  static const String coinGeckoBaseUrl = 'https://api.coingecko.com/api/v3/';

  // Firebase Config Keys
  static const String firebaseApiKey = 'AIzaSyBp056Xfmg9HZDxOxTHSk5p3-GiI7sGXtI';
  static const String firebaseProjectId = 'reliveapp-75f97';

  // Miscellaneous Constants
  static const String termsAndConditionsUrl = 'https://www.example.com/terms';
  static const String privacyPolicyUrl = 'https://www.example.com/privacy';
  static const String contactEmail = 'support@example.com';

  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration splashScreenDuration = Duration(seconds: 3);

  // Default Colors (example usage in themes)
  static const int primaryColorHex = 0xFF4CAF50; // Green
  static const int secondaryColorHex = 0xFF388E3C; // Dark Green
  static const int accentColorHex = 0xFFFFC107; // Amber
}
