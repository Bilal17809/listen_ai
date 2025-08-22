import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listen_ai/data/models/library_item.dart';
import '../../../core/services/my_library_service.dart';

class MyLibraryController extends GetxController {
  final MyLibraryService _libraryService = Get.find<MyLibraryService>();

  RxBool isLoaded = false.obs;

  RxList<LibraryItem> get libraryItems => _libraryService.items;

  @override
  void onInit() {
    super.onInit();
    loadLibraryIfNeeded();
  }

  Future<void> loadLibraryIfNeeded() async {
    if (!isLoaded.value) {
      await _libraryService.init();
      isLoaded.value = true;
    }
  }

  LibraryItem? addItem(String fullText) {
    final addedItem = _libraryService.addItem(fullText);
    if (addedItem != null) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Saved to library ✅",
          duration: Duration(seconds: 1),
          borderRadius: 8,
          margin: EdgeInsets.all(12),
        ) ,
      );
    }
    return addedItem;
  }

  void removeItem(String id) {
    _libraryService.removeItem(id);
  }

  void clearLibrary() {
    _libraryService.clearAllItems();
  }
}
