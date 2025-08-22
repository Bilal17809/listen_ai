// File: lib/core/services/my_library_service.dart

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'dart:convert'; // For JSON encoding/decoding
import 'package:uuid/uuid.dart';

import '../../data/models/library_item.dart';

/// Service to manage the user's saved library items with persistence.
class MyLibraryService extends GetxService {
  static const String _prefsKey = 'my_library_items'; // Key for SharedPreferences
  final RxList<LibraryItem> _items = <LibraryItem>[].obs;
  RxList<LibraryItem> get items => _items;

  /// Loads items from SharedPreferences when the service is initialized.
  /// This should be called once during app startup.
  Future<void> loadItems() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? itemsJson = prefs.getString(_prefsKey);

      if (itemsJson != null && itemsJson.isNotEmpty) {
        final List<dynamic> itemsList = json.decode(itemsJson);
        _items.assignAll(itemsList.map((itemJson) => LibraryItem.fromJson(itemJson as Map<String, dynamic>)).toList());
        // Sort items by savedAt descending (newest first) after loading
        _items.sort((a, b) => b.savedAt.compareTo(a.savedAt));
      }
    } catch (e) {
      print("Error loading library items: $e");
      // Handle error appropriately, maybe show a snackbar or log it
    }
  }

  /// Saves the current list of items to SharedPreferences.
  /// This should be called whenever the list changes (add, remove).
  Future<void> _saveItems() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<Map<String, dynamic>> itemsToJson = _items.map((item) => item.toJson()).toList();
      final String jsonString = json.encode(itemsToJson);
      await prefs.setString(_prefsKey, jsonString);
    } catch (e) {
      print("Error saving library items: $e");
      // Handle error appropriately
    }
  }

  String _generateTitle(String fullText) {
    const int maxLength = 20;
    if (fullText.length <= maxLength) {
      return fullText;
    }
    int endIndex = fullText.lastIndexOf(' ', maxLength);
    if (endIndex == -1) {
      endIndex = maxLength;
    }
    return '${fullText.substring(0, endIndex)}...';
  }

  LibraryItem? addItem(String fullText) {
    if (fullText.trim().isEmpty) {
      return null;
    }

    final String id = const Uuid().v4();
    final String title = _generateTitle(fullText);
    final DateTime savedAt = DateTime.now();

    final LibraryItem newItem = LibraryItem(
      id: id,
      title: title,
      fullText: fullText,
      savedAt: savedAt,
    );

    _items.add(newItem);
    _items.sort((a, b) => b.savedAt.compareTo(a.savedAt));

    // Save to persistent storage after adding
    _saveItems();

    return newItem;
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    // Save to persistent storage after removing
    _saveItems();
  }

  void clearAllItems() {
    _items.clear();
    // Save empty list to persistent storage
    _saveItems();
  }
}
