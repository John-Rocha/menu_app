import 'package:menu_app/features/product/models/modifier_info.dart';
import 'package:menu_app/features/product/models/product.dart';

import '../modifier.dart';

class ModifierWithProducts extends Modifier {
  ModifierWithProducts({required super.info, required this.products});

  ModifierWithProducts.fromJson(Map<String, dynamic> json)
      : products = json['products']
            .map<Product?>((p) => Product.fromJson(p))
            .toList()
            .clear,
        super(
          info: ModifierInfo.fromJson(json['info']),
        );

  final List<Product> products;
}
