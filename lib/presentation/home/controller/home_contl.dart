import 'dart:io';
import 'package:get/get.dart';
import '../../../core/services/document_service.dart';
import '../../../core/services/image_service.dart';
import '../../../core/services/text_recognition_service.dart';

class HomeController extends GetxController {
  HomeController({
    required DocumentService documentService,
    required ImageService imageService,
    required TextRecognitionService textService,
  }) : _documentService = documentService,
       _imageService = imageService,
       _textService = textService;

  final DocumentService _documentService;
  final ImageService _imageService;
  final TextRecognitionService _textService;

  final selectedFilePath = "".obs;
  final scannedText = "".obs;
  final pickedImage = Rx<File?>(null);
  RxBool isLoading = false.obs;

  Future<void> pickFile() async {
    try {
      final path = await _documentService.pickFile();
      if (path != null) {
        selectedFilePath.value = path;
        Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to pick file");
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final file = await _imageService.pickImageFromCamera();
      if (file != null) {
        pickedImage.value = file;
        await extractTextFromImage(file);
      } else {
        if (Get.isOverlaysOpen) Get.back();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to capture image");
    }
  }

  Future<void> extractTextFromImage(File imageFile) async {
    try {
      isLoading.value = true;
      final text = await _textService.extractTextFromImage(imageFile);
      scannedText.value = text;
    } catch (e) {
      Get.snackbar("Error", "Failed to extract text");
    } finally {
      isLoading.value = false;
    }
  }
}
