import 'package:flutter/foundation.dart';

import 'modifier_info.dart';
import 'modifiers/modifier_with_category.dart';
import 'modifiers/modifier_with_products.dart';
import 'modifiers/simple_modifier.dart';

class Modifier {
  Modifier({required this.info});

  static Modifier? fromJson(Map<String, dynamic> json) {
    try {
      switch (json['__component']) {
        case 'product.modifier':
          return SimpleModifier.fromJson(json);
        case 'product.modificador-com-produto':
          return ModifierWithProducts.fromJson(json);
        case 'product.modificador-com-categoria':
          return ModifierWithCategory.fromJson(json);
        default:
          return null;
      }
    } catch (e, s) {
      debugPrint('$e $s');
      return null;
    }
  }

  final ModifierInfo info;

  @override
  String toString() {
    return 'Modifier{info: $info}';
  }
}
