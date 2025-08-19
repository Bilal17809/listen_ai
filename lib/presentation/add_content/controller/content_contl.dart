import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class ContentController extends GetxController {
  var selectedFilePath = "".obs;
  var scannedText = "".obs;
  var pickedImage = Rx<File?>(null);
  var isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'epub', 'docx', 'txt'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.single;
      selectedFilePath.value = file.path ?? "";
      Get.back();
    }
  }

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedImage.value = File(image.path);
      await extractTextFromImage(File(image.path));
    } else {
      // Agar user cancel kare → screen band kardo
      if (Get.isOverlaysOpen) {
        Get.back();
      }
    }
  }

  Future<void> extractTextFromImage(File imageFile) async {
    isLoading.value = true;
    final inputImage = InputImage.fromFile(imageFile);
    final textRecognizer = TextRecognizer();

    final RecognizedText recognisedText =
    await textRecognizer.processImage(inputImage);

    scannedText.value = recognisedText.text;
    await textRecognizer.close();
    isLoading.value = false;
  }
}
