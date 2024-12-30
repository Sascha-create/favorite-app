import 'package:favorites_app/models/product.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Product> _products = [
    Product(id: '1', name: 'Banane'),
    Product(id: '2', name: 'Apfel'),
    Product(id: '3', name: 'Erdbeere'),
    Product(id: '4', name: 'Birne'),
  ];

  int _counter = 0;

  int get counter => _counter;

  List<Product> get products => _products;

  void toggleFavorite(String id) {
    final product = _products.firstWhere((product) => product.id == id);
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      _counter++;
    } else {
      _counter--;
    }
    notifyListeners();
  }
}
