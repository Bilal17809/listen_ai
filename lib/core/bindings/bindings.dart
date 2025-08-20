import 'package:get/get.dart';
import '../../presentation/home/controller/home_contl.dart';
import '../../core/services/document_service.dart';
import '../../core/services/image_service.dart';
import '../../core/services/text_recognition_service.dart';
import '../../presentation/listen/controller/listen_controller.dart';
import '../../presentation/type_paste_text/controller/type_paste_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentService>(() => DocumentService(),fenix: true);
    Get.lazyPut<ImageService>(() => ImageService(),fenix: true);
    Get.lazyPut<TextRecognitionService>(() => TextRecognitionService(),fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(
      documentService: Get.find<DocumentService>(),
      imageService: Get.find<ImageService>(),
      textService: Get.find<TextRecognitionService>(),
    ),fenix: true);
    Get.lazyPut<TypePasteController>(() => TypePasteController(),fenix: true);
    Get.lazyPut<ListenController>(() => ListenController(), fenix: true);
  }
}