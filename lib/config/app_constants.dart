class AppConstants {
  // Private constructor
  AppConstants._();
  
  // App info
  static const String appName = 'Tailor App';
  static const String appVersion = '1.0.0';
  static const String appTagline = 'Seamlessly Digitize Your Tailoring Business';
  
  // API endpoints (to be replaced with your Laravel API endpoints)
  static const String baseUrl = 'https://api.tailorapp.com/api';
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String registerEndpoint = '$baseUrl/auth/register';
  
  // Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String onboardingKey = 'onboarding_completed';
  
  // Assets
  static const String logoPath = 'assets/images/logo.png';
  static const String logoWithTextPath = 'assets/images/logo_with_text.png';
  static const String splashBgPath = 'assets/images/splash_bg.png';
  static const String authBgPath = 'assets/images/auth_bg.png';
  
  // Default values
  static const double defaultPadding = 20.0;
  static const double defaultMargin = 16.0;
  static const double defaultRadius = 14.0;
  
  // Animation durations
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration transitionDuration = Duration(milliseconds: 300);
}