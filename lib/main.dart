// import 'package:blog_app/app/app.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }


import 'package:blog_app/app/app.dart';
import 'package:blog_app/core/networking/local/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}