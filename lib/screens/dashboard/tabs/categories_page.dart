import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';
import 'package:gestion_de_stock_flutter/widgets/categories/category_card.dart';

// ignore: must_be_immutable
class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final CategoryRepository repository = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    final categories = repository.getAllCategories();

    return ListView.separated(
      padding: const EdgeInsets.all(12),

      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return CategoryCard(
          category: category,
          onTap: () {
            debugPrint("Clicked: ${category.name}");
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 12);
      },
    );
  }
}
