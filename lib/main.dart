import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'core/services/category_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listen AI',
      theme: ThemeData(

      ),
      home: MainBottomBar(),
    );
  }
}
