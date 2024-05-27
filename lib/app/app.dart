import 'package:blog_app/screens/splash_screen.dart';
import 'package:blog_app/theme/theme_data.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
       
      home: const SplashScreen(),
    );
  }
}
