import 'package:get/get.dart';
import '../../presentation/add_content/controller/content_contl.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentController>(() => ContentController());

  }
}
