import 'package:get/get.dart';
import '../../data/repositories/my_library_repository.dart';
import '../../presentation/bottom_nav/controller/bottom_nav.dart';
import '../../presentation/document/controller/document_controller.dart';
import '../../presentation/home/controller/home_contl.dart';
import '../../core/services/document_service.dart';
import '../../core/services/image_service.dart';
import '../../core/services/text_recognition_service.dart';
import '../../presentation/listen/controller/listen_controller.dart';
import '../../presentation/my_library/controller/my_library_contrl.dart';
import '../../presentation/settings/controller/settings_controller.dart';
import '../../presentation/type_paste_text/controller/type_paste_controller.dart';
import '../../data/services/tts_service.dart';
import '../../presentation/camera/controller/camera_controller.dart';
import '../services/my_library_service.dart';
import '../services/text_extraction_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DocumentService>(() => DocumentService(), fenix: true);
    Get.lazyPut<ImageService>(() => ImageService(), fenix: true);
    Get.lazyPut<TextRecognitionService>(
      () => TextRecognitionService(),
      fenix: true,
    );
    Get.lazyPut<TtsService>(() => TtsService(), fenix: true);
    Get.lazyPut<BottomBarController>(() => BottomBarController(),fenix: true);
    Get.lazyPut<MyLibraryService>(() => MyLibraryService(Get.find()), fenix: true);
    Get.lazyPut(()=>MyLibraryRepository(),fenix: true);
    Get.lazyPut<MyLibraryController>(() => MyLibraryController(), fenix: true);
    Get.lazyPut<CameraController>(
      () => CameraController(
        imageService: Get.find<ImageService>(),
        textService: Get.find<TextRecognitionService>(),
      ),
      fenix: true,
    );

    Get.lazyPut<HomeController>(
      () => HomeController(documentService: Get.find<DocumentService>()),
      fenix: true,
    );

    Get.lazyPut<TypePasteController>(() => TypePasteController(), fenix: true);
    Get.lazyPut<ListenController>(
      () => ListenController(Get.find<TtsService>()),
      fenix: true,
    );
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);

    Get.lazyPut<TextExtractionService>(() => TextExtractionServiceImpl(), fenix: true);
    Get.lazyPut<DocumentController>(() => DocumentController(
      documentService: Get.find<DocumentService>(),
      textExtractionService: Get.find<TextExtractionService>(),
    ), fenix: true);

  }

}
