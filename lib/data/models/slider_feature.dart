class SliderFeature {
  final String imagePath;
  final String title;

  SliderFeature({
    required this.imagePath,
    required this.title,
  });

  factory SliderFeature.fromJson(Map<String, String> json) {
    return SliderFeature(
      imagePath: json['img'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'img': imagePath,
      'title': title,
    };
  }
}