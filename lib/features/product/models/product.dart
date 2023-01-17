import 'package:flutter/foundation.dart' hide Category;
import 'package:menu_app/features/product/models/category.dart';
import 'package:menu_app/features/product/models/modifier.dart';

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.originalBasePrice,
    required this.basePrice,
    required this.imageUrl,
    required this.category,
    required this.modifiers,
  });

  static Product? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    try {
      final attr = json['attributes'];
      return Product(
        id: json['id'],
        title: attr['title'],
        description: attr['description'],
        originalBasePrice: attr['originalBasePrice'],
        basePrice: attr['basePrice'],
        imageUrl: attr['image']['data']['attributes']['url'],
        category: Category.fromJson(attr['data']),
        modifiers: attr['options']
            .map<Modifier?>((modifier) => Modifier.fromJson(modifier))
            .where((m) => m != null)
            .toList(),
      );
    } catch (e, s) {
      debugPrint('$e $s');
      return null;
    }
  }

  final int id;
  final String title;
  final String description;
  final num? originalBasePrice;
  final num basePrice;
  final String imageUrl;

  final Category? category;
  final List<Modifier> modifiers;

  @override
  String toString() {
    return 'Product{id: $id, title: $title, basePrice: $basePrice, modifiers: $modifiers}';
  }
}
