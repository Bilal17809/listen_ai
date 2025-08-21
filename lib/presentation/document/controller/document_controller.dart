import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/services/document_service.dart';
import '../../../../core/services/text_extraction_service.dart';
import '../../../../core/utils/document_types.dart';
import '../../listen/view/listen_screen.dart';

class DocumentController extends GetxController {
  final DocumentService _documentService;
  final TextExtractionService _textExtractionService;

  DocumentController({
    required DocumentService documentService,
    required TextExtractionService textExtractionService,
  })  : _documentService = documentService,
        _textExtractionService = textExtractionService;

  final selectedFilePath = "".obs;
  final Rx<String?> _extractedText = Rx<String?>(null);
  String? get extractedText => _extractedText.value;
  final RxBool isExtracting = false.obs;


  Future<void> pickFile() async {
    try {
      final path = await _documentService.pickFile();
      if (path != null) {
        selectedFilePath.value = path;
        Get.back();
        await extractTextFromFile(File(path));
      }
    } catch (e) {
      Get.snackbar("File Pick Error", "Failed to pick file: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> extractTextFromFile(File file) async {
    final String? filePath = selectedFilePath.value.isEmpty ? null : selectedFilePath.value;
    if (filePath == null || filePath.isEmpty) {
      Get.snackbar("Extraction Error", "No file selected for extraction.", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final SupportedDocumentType? docType = SupportedDocumentType.fromPath(filePath);
    if (docType == null) {
      Get.snackbar("Unsupported File", "Selected file type is not supported for text extraction.", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isExtracting.value = true;
      _extractedText.value = null;

      Get.dialog(
        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Extracting text..."),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );

      final String text = await _textExtractionService.extractText(file, docType);
      _extractedText.value = text;


      if (Get.isDialogOpen ?? false) Get.back();

      if (_extractedText.value != null && _extractedText.value!.isNotEmpty) {
        Get.to(() => ListenScreen(text: _extractedText.value!));

      } else {
        Get.snackbar("No Text", "No text could be extracted from the document.", snackPosition: SnackPosition.BOTTOM);
      }

    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar("Extraction Failed", "Could not extract text: $e", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isExtracting.value = false;
    }
  }

  void clearState() {
    selectedFilePath.value = "";
    _extractedText.value = null;
    isExtracting.value = false;
  }

  @override
  void onClose() {
    clearState();
    super.onClose();
  }
}