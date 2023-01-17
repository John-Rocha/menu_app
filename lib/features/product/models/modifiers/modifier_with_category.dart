import '../category.dart';
import '../modifier.dart';
import '../modifier_info.dart';

class ModifierWithCategory extends Modifier {
  ModifierWithCategory({required super.info, required this.category});

  ModifierWithCategory.fromJson(Map<String, dynamic> json)
      : category = Category.fromJson(json['category'])!,
        super(
          info: ModifierInfo.fromJson(json['info']),
        );

  final Category category;
}
