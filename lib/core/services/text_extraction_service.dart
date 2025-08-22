import 'dart:io';
import 'package:archive/archive.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:xml/xml.dart';
import '../utils/document_types.dart';

abstract class TextExtractionService {
  Future<String> extractText(File file, SupportedDocumentType type);
}

class TextExtractionServiceImpl implements TextExtractionService {
  @override
  Future<String> extractText(File file, SupportedDocumentType type) async {
    switch (type) {
      case SupportedDocumentType.pdf:
        return await _extractTextFromPdf(file);
      case SupportedDocumentType.txt:
        return await _extractTextFromTxt(file);
      case SupportedDocumentType.docx:
        return await _extractTextFromDocx(file);
      case SupportedDocumentType.epub:
        return await _extractTextFromEpub(file);
    }
  }

  Future<String> _extractTextFromTxt(File file) async {
    return await file.readAsString();
  }

  Future<String> _extractTextFromPdf(File file) async {
    final bytes = await file.readAsBytes();
    final document = PdfDocument(inputBytes: bytes);
    final textExtractor = PdfTextExtractor(document);
    final text = textExtractor.extractText();
    document.dispose();
    return text.replaceAll('\u00A0', ' ').replaceAll('Â', '').trim();
  }

  Future<String> _extractTextFromDocx(File file) async {
    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    final docFile = archive.firstWhere(
          (f) => f.name == "word/document.xml",
      orElse: () => throw Exception("document.xml not found"),
    );
    final content = XmlDocument.parse(String.fromCharCodes(docFile.content));
    final textBuffer = StringBuffer();
    for (final node in content.findAllElements("w:t")) {
      textBuffer.write(node.text);
      textBuffer.write(" ");
    }
    return textBuffer.toString().replaceAll('\u00A0', ' ').replaceAll('Â', '').trim();
  }

  Future<String> _extractTextFromEpub(File file) async {
    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    final containerFile = archive.firstWhere(
          (f) => f.name == "META-INF/container.xml",
      orElse: () => throw Exception("container.xml not found in EPUB"),
    );
    final containerXml = XmlDocument.parse(String.fromCharCodes(containerFile.content));
    final rootfile = containerXml.findAllElements('rootfile').first.getAttribute('full-path');
    if (rootfile == null) throw Exception("Rootfile not found in container.xml");
    final opfFile = archive.firstWhere((f) => f.name == rootfile);
    final opfXml = XmlDocument.parse(String.fromCharCodes(opfFile.content));
    final items = opfXml.findAllElements('item');
    final chapterFiles = items
        .where((i) {
      final mediaType = i.getAttribute('media-type');
      return mediaType == 'application/xhtml+xml' || mediaType == 'text/html';
    })
        .map((i) => i.getAttribute('href'))
        .whereType<String>()
        .toList();
    final textBuffer = StringBuffer();
    final opfBasePath = rootfile.substring(0, rootfile.lastIndexOf('/') + 1);
    for (final chapterPath in chapterFiles) {
      final fullPath = opfBasePath + chapterPath;
      final chapterFile = archive.firstWhere(
            (f) => f.name == fullPath,
        orElse: () => throw Exception("Chapter file not found: $fullPath"),
      );
      final htmlContent = String.fromCharCodes(chapterFile.content);
      final document = html_parser.parse(htmlContent);
      textBuffer.writeln(document.body?.text ?? '');
    }
    return textBuffer.toString().replaceAll('\u00A0', ' ').replaceAll('Â', '').trim();
  }
}
