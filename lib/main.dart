import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure Get is imported correctly
import 'package:my_tailor/local-storage_services/shared_preferences.dart';
import 'package:my_tailor/routes/routes_config.dart';
import 'package:my_tailor/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init(); // Ensure this is initialized before runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes(), // Ensure appRoutes() returns a List<GetPage>
      debugShowCheckedModeBanner: false,
      title: 'My Tailor',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
