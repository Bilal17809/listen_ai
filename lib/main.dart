import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/bindings/bindings.dart';
import 'core/theme/app_theme.dart';
import 'core/local_storage/local_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isDarkTheme = await LocalStorageService.isDarkTheme();

  runApp(MyApp(isDarkTheme: isDarkTheme));
}

class MyApp extends StatelessWidget {
  final bool isDarkTheme;

  const MyApp({super.key, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.home,
      getPages: appPages,
    );
  }
}