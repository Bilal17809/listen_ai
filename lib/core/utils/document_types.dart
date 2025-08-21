
enum SupportedDocumentType {
  pdf('pdf'),
  txt('txt'),
  docx('docx'),
  epub('epub');

  final String extension;

  const SupportedDocumentType(this.extension);


  static SupportedDocumentType? fromPath(String? path) {
    if (path == null || path.isEmpty) return null;
    final lowerPath = path.toLowerCase();
    for (final type in values) {
      if (lowerPath.endsWith('.${type.extension}')) {
        return type;
      }
    }
    return null; 
  }
}