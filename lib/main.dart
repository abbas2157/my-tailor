import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_tailor/local-storage_services/shared_preferences.dart';
import 'package:my_tailor/routes/routes_config.dart';
import 'package:my_tailor/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes(),
      debugShowCheckedModeBanner: false,
      title: 'My Tailor',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
