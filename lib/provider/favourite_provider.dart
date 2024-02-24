import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;

  void addItem(int value) {
    _selectedItems.add(value);
    notifyListeners();
  }
}
