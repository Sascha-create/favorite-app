import 'package:favorites_app/logic/favorites_provider.dart';
import 'package:favorites_app/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritesProvider>(
            create: (_) => FavoritesProvider())
      ],
      child: MaterialApp(
        title: 'Favorites App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        home: const ProductsScreen(), // Statische Version zuerst
      ),
    );
  }
}
