class Localization {
  static String getText(String key) {
    const Map<String, String> en = {
      'welcome': 'Welcome',
      'login': 'Login',
      'signup': 'Sign Up',
    };

    return en[key] ?? key;
  }
}
