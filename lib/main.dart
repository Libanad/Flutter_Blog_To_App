// import 'package:blog_app/app/app.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }


import 'package:blog_app/app/app.dart';
import 'package:blog_app/core/networking/local/hive_service.dart';
import 'package:blog_app/features/blog/data/model/blog_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
    Hive.registerAdapter(BlogPostHiveModelAdapter());
    

  
  await Hive.openBox<BlogPostHiveModel>('blogPosts');

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}