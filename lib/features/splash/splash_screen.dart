import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../config/app_constants.dart';
import '../../config/app_theme.dart';
import '../../config/routes.dart';
import '../auth/services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  
  @override
  void initState() {
    super.initState();
    
    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );
    
    // Start animation
    _animationController.forward();
    
    // Initialize the auth service
    Get.putAsync(() => AuthService().init());
    
    // Navigate to the appropriate screen after a delay
    Future.delayed(const Duration(milliseconds: 2000), () {
      _navigateToNextScreen();
    });
  }
  
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
  void _navigateToNextScreen() {
    final authService = Get.find<AuthService>();
    
    if (authService.isLoggedIn) {
      // User is logged in, navigate to home screen
      Get.offAllNamed(AppRoutes.home);
    } else {
      // User is not logged in, navigate to sign in screen
      Get.offAllNamed(AppRoutes.signIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          // You can replace this with the actual splash background image
          // image: DecorationImage(
          //   image: AssetImage(AppConstants.splashBgPath),
          //   fit: BoxFit.cover,
          // ),
          color: Colors.white,
        ),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo with fade and scale animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Image.asset(
                        AppConstants.logoPath,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // App name with fade animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      AppConstants.appName,
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Tagline with fade animation
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const Text(
                      AppConstants.appTagline,
                      style: TextStyle(
                        color: AppTheme.subtextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Loading indicator
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppTheme.primaryColor,
                      ),
                      strokeWidth: 3,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}