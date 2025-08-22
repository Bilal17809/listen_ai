import 'package:get/get.dart';
import 'package:listen_ai/presentation/home/view/home_page.dart';
import 'package:listen_ai/presentation/listen/view/listen_screen.dart';
import 'package:listen_ai/presentation/my_library/view/my_library_screen.dart';
import '../../presentation/type_paste_text/view/type_paste_screen.dart';
import '../bindings/bindings.dart';
import 'app_routes.dart';

final List<GetPage> appPages = [
   GetPage(name: AppRoutes.home, page: () => HomePage(), binding: AppBindings()),
  GetPage(name: AppRoutes.typePasteText, page: () => TypePasteScreen()),
  GetPage(
    name: AppRoutes.listenScreen,
    page: () => ListenScreen(text: Get.arguments),
  ),
  GetPage(
    name: AppRoutes.myLibrary,
    page: () => MyLibraryScreen(),
  ),
];
