import 'package:get/get.dart';
import '../features/auth/screens/sign_in_screen.dart';
import '../features/auth/screens/sign_up_screen.dart';
import '../features/home/home_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/splash/splash_screen.dart';

class AppRoutes {
  // Private constructor
  AppRoutes._();
  
  // Route names
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String forgotPassword = '/forgot-password';
  static const String clients = '/clients';
  static const String orders = '/orders';
  static const String measurements = '/measurements';
  static const String fabrics = '/fabrics';
  static const String settings = '/settings';
  
  // Get Pages
  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signIn,
      page: () => const SignInScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}