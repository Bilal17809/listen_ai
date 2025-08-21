import 'dart:io';
import 'image_service.dart';
import 'text_recognition_service.dart';

class CameraService {
  final ImageService _imageService;
  final TextRecognitionService _textRecognitionService;

  CameraService(this._imageService, this._textRecognitionService);

  Future<File?> captureImage() async {
    return await _imageService.pickImageFromCamera();
  }

  Future<String> extractTextFromImage(File imageFile) async {
    return await _textRecognitionService.extractTextFromImage(imageFile);
  }
}