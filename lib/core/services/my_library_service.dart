import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:listen_ai/data/models/library_item.dart';
import 'package:listen_ai/data/repositories/my_library_repository.dart';

class MyLibraryService extends GetxService {
  final MyLibraryRepository _repository;
  MyLibraryService(this._repository);

  final RxList<LibraryItem> items = <LibraryItem>[].obs;

  Future<void> init() async {
    final loadedItems = await _repository.loadItems();
    items.assignAll(
      loadedItems..sort((a, b) => b.savedAt.compareTo(a.savedAt)),
    );
  }

  LibraryItem? addItem(String fullText) {
    if (fullText.trim().isEmpty) return null;

    final exists = items.any((e) => e.fullText == fullText);
    if (exists) {
      return null;
    }

    final newItem = LibraryItem(
      id: const Uuid().v4(),
      title: _generateTitle(fullText),
      fullText: fullText,
      savedAt: DateTime.now(),
    );

    items.add(newItem);
    items.sort((a, b) => b.savedAt.compareTo(a.savedAt));
    _repository.saveItems(items);
    return newItem;
  }

  void removeItem(String id) {
    items.removeWhere((e) => e.id == id);
    _repository.saveItems(items);
  }

  void clearAllItems() {
    items.clear();
    _repository.clearItems();
  }

  String _generateTitle(String text) {
    const int maxLength = 20;
    if (text.length <= maxLength) return text;
    final endIndex = text.lastIndexOf(' ', maxLength);
    return '${text.substring(0, endIndex == -1 ? maxLength : endIndex)}...';
  }
}
