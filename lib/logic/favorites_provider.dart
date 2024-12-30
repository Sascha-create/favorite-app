import 'package:favorites_app/models/product.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addProduct(Product product) {
    _favoriteProducts.add(product);
  }
}
