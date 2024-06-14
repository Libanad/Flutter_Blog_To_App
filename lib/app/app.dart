// import 'package:blog_app/app/navigator_key/navigator_key.dart';
// import 'package:blog_app/app/screens/splash_screen.dart';
// import 'package:blog_app/app/screens/theme_data.dart';
// import 'package:flutter/material.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       navigatorKey: AppNavigator.navigatorKey,
//       theme: getApplicationTheme(),
       
//       home: const SplashScreen(),
//     );
//   }
// }

import 'package:blog_app/app/navigator_key/navigator_key.dart';
import 'package:blog_app/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
 
class App extends StatelessWidget {
  const App({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.navigatorKey,
      // themes
      // theme: getApplicationTheme(),
      home: const LoginView(),
    );
  }
}
