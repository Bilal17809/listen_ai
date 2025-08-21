import 'package:get/get.dart';
import '../../../core/services/document_service.dart';

class HomeController extends GetxController {
  HomeController({
    required DocumentService documentService,
  }) : _documentService = documentService;

  final DocumentService _documentService;

  final selectedFilePath = "".obs;

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