// Statische Implementierung ohne Provider
import 'package:favorites_app/logic/favorites_provider.dart';
import 'package:favorites_app/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favoritesProvider, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            IconButton(
              icon: Stack(clipBehavior: Clip.none, children: [
                const Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.black54,
                ),
                Positioned(
                  child: Container(
                    width: 14,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Center(
                      child: Text(
                        '${favoritesProvider.counter}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritesScreen(
                      favoriteProducts: favoritesProvider.products
                          .where((product) => product.isFavorite)
                          .toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: favoritesProvider.products.length,
          itemBuilder: (context, index) {
            final product = favoritesProvider.products[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: const Color.fromARGB(255, 150, 202, 228),
              child: ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  icon: Icon(
                    favoritesProvider.products[index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: favoritesProvider.products[index].isFavorite
                        ? Colors.red
                        : null,
                  ),
                  onPressed: () {
                    favoritesProvider.toggleFavorite(product.id);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
