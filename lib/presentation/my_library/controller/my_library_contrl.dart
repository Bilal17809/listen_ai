
import 'package:get/get.dart';

import '../../../core/services/my_library_service.dart';
import '../../../data/models/library_item.dart';

class MyLibraryController extends GetxController {
  final MyLibraryService _libraryService = Get.find<MyLibraryService>();
  RxBool _isLoaded = false.obs;

  RxList<LibraryItem> get libraryItems => _libraryService.items;

  Future<void> loadLibraryIfNeeded() async {
    if (!_isLoaded.value) {
      await _libraryService.loadItems();
      _isLoaded.value = true;
    }
  }


  LibraryItem? addItem(String fullText) {
    final LibraryItem? addedItem = _libraryService.addItem(fullText);
    if (addedItem != null) {

    } else if (fullText.trim().isEmpty) {
      Get.snackbar(
        "Empty Text",
        "Cannot save empty text.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return addedItem;
  }

  void removeItem(String id) {
    _libraryService.removeItem(id);

  }


}
