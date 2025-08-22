class LibraryItem {
  final String id;

  final String title;

  final String fullText;

  final DateTime savedAt;

  LibraryItem({
    required this.id,
    required this.title,
    required this.fullText,
    required this.savedAt,
  });

  factory LibraryItem.fromJson(Map<String, dynamic> json) {
    return LibraryItem(
      id: json['id'],
      title: json['title'],
      fullText: json['fullText'],
      savedAt: DateTime.parse(json['savedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'fullText': fullText,
      'savedAt': savedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'LibraryItem(id: $id, title: $title, savedAt: $savedAt)';
  }
}
