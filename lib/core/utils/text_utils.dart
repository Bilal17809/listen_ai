class TextUtils {
  static List<String> splitText(String text, {int chunkSize = 200}) {
    if (text.isEmpty) return [];

    final words = text.split(" ");
    List<String> chunks = [];
    String current = "";

    for (var word in words) {
      if ((current + word).length > chunkSize) {
        if (current.trim().isNotEmpty) {
          chunks.add(current.trim());
        }
        current = "";
      }
      current += "$word ";
    }

    if (current.trim().isNotEmpty) {
      chunks.add(current.trim());
    }

    return chunks;
  }

  static String getTtsUrl(String text, {String langCode = 'en'}) {
    final encoded = Uri.encodeComponent(text);
    return 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$encoded&tl=$langCode';
  }
}