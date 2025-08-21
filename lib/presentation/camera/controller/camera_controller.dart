import 'dart:io';
import 'package:get/get.dart';
import '../../../core/services/image_service.dart';
import '../../../core/services/text_recognition_service.dart';

class CameraController extends GetxController {
  final ImageService _imageService;
  final TextRecognitionService _textService;

  CameraController({
    required ImageService imageService,
    required TextRecognitionService textService,
  })  : _imageService = imageService,
        _textService = textService;


  final Rx<File?> pickedImage = Rx<File?>(null);
  final RxString scannedText = "".obs;
  final RxBool isLoading = false.obs;

  Future<void> captureImage() async {
    try {
      isLoading.value = true;
      final File? imageFile = await _imageService.pickImageFromCamera();

      if (imageFile != null) {
        pickedImage.value = imageFile;
        await extractTextFromImage(imageFile);
      }
    } catch (e) {
      Get.snackbar(
        "Camera Error",
        "Failed to capture image: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
    }
  }


  Future<void> extractTextFromImage(File imageFile) async {
    try {
      final String extractedText = await _textService.extractTextFromImage(imageFile);
      scannedText.value = extractedText;
    } catch (e) {
      // Improved error handling
      Get.snackbar(
        "Text Extraction Error",
        "Failed to extract text: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearState() {
    pickedImage.value = null;
    scannedText.value = "";
    isLoading.value = false;
  }

  @override
  void onClose() {
    clearState();
    super.onClose();
  }
}
