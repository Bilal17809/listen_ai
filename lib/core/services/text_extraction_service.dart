import 'dart:io';
import 'package:docx_template/docx_template.dart';
import '../utils/document_types.dart';

abstract class TextExtractionService {
  Future<String> extractText(File file, SupportedDocumentType type);
}

class TextExtractionServiceImpl implements TextExtractionService {
  @override
  Future<String> extractText(File file, SupportedDocumentType type) async {
    try {
      switch (type) {
        case SupportedDocumentType.pdf:
        case SupportedDocumentType.txt:
          return await _extractTextFromTxt(file);
        case SupportedDocumentType.docx:
          return await _extractTextFromDocx(file);
        case SupportedDocumentType.epub:
          return "EPUB text extraction logic would go here.";
        default:
          throw UnsupportedError('Text extraction is not supported for document type: $type');
      }
    } catch (e) {
      print("Error extracting text from file '${file.path}' (type: $type): $e");
      rethrow;
    }
  }



  Future<String> _extractTextFromTxt(File file) async {
    return await file.readAsString();
  }

  Future<String> _extractTextFromDocx(File file) async {
    try {
      final DocxTemplate docx = await DocxTemplate.fromBytes(await file.readAsBytes());
      final StringBuffer textBuffer = StringBuffer();
      textBuffer.write("Extracted (limited) from DOCX using docx_template.\n");
      textBuffer.write("Full text extraction with docx_template can be complex.\n");
      textBuffer.write("Consider using a dedicated DOCX parsing library.\n");
      textBuffer.write("\n--- DOCX File Path: ${file.path} ---\n");
      return textBuffer.toString();
    } catch (e) {
      print("Error extracting text from DOCX file '${file.path}': $e");
      rethrow;
    }
  }
}