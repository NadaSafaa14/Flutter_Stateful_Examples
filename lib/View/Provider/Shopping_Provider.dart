import 'package:flutter/material.dart';

class ShoppingProvider extends ChangeNotifier {
  final List<IconData> icons = const [
    Icons.watch,
    Icons.headphones,
    Icons.laptop,
    Icons.camera_alt,
    Icons.smartphone,
    Icons.tablet,
    Icons.tv,
    Icons.alarm,
  ];

  final List<String> names = const [
    'Smartwatch',
    'Headphones',
    'Laptop',
    'Camera',
    'Smartphone',
    'Tablet',
    'TV',
    'Alarm',
  ];

  final List<double> prices = const [
    120,
    149.99,
    999.99,
    299.99,
    699.99,
    499.99,
    199.99,
    249.99,
  ];

  late List<bool> isAdded = List.filled(icons.length, false);
  late List<int> quantities = List.filled(icons.length, 0);

  void increaseQuantity(int index) {
    quantities[index]++;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (quantities[index] > 1) {
      quantities[index]--;
    } else {
      quantities[index] = 0;
      isAdded[index] = false;
    }
    notifyListeners();
  }

  void toggle(int index) {
    isAdded[index] = !isAdded[index];

    if (isAdded[index]) {
      quantities[index] = 1;
    } else {
      quantities[index] = 0;
    }
    notifyListeners();
  }
}
