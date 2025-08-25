import 'package:get/get.dart';
import '../../../core/services/document_service.dart';
import '../../../core/services/slider_feature_service.dart';
import '../../../data/models/slider_feature.dart';

class HomeController extends GetxController {
  HomeController({
    required DocumentService documentService,
  }) : _documentService = documentService;

  final DocumentService _documentService;
  var currentIndex = 0.obs;
  final List<SliderFeature> sliderFeatures = SliderFeatureService.sliderImageFeatures;

  final selectedFilePath = "".obs;
  
  void updateIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> pickFile() async {
    try {
      final path = await _documentService.pickFile();
      if (path != null) {
        selectedFilePath.value = path;
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick file: $e");
    }
  }
}