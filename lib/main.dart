import 'package:flutter/material.dart';



import 'core/services/category_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listen AI',
      theme: ThemeData(

      ),
      home: MainBottomBar(),
    );
  }
}
