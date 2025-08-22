import 'dart:convert';
import 'package:listen_ai/core/local_storage/local_storage_service.dart';
import 'package:listen_ai/data/models/library_item.dart';

class MyLibraryRepository {
  static const String _prefsKey = 'my_library_items';

  Future<List<LibraryItem>> loadItems() async {
    final data = await LocalStorageService.getString(_prefsKey);
    if (data == null || data.isEmpty) return [];
    final decoded = json.decode(data) as List<dynamic>;
    return decoded.map((e) => LibraryItem.fromJson(e)).toList();
  }

  Future<void> saveItems(List<LibraryItem> items) async {
    final encoded = json.encode(items.map((e) => e.toJson()).toList());
    await LocalStorageService.saveString(_prefsKey, encoded);
  }

  Future<void> clearItems() async {
    await LocalStorageService.clearKey(_prefsKey);
  }
}
