import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/add_category_page.dart';
import 'package:gestion_de_stock_flutter/widgets/categories/category_card.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesPage> {
  final CategoryRepository repository = CategoryRepository();

  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    categories = repository.getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: categories.isEmpty
          ? const Center(child: Text("No categoris found"))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  category: category,
                  onTap: () => debugPrint("Clicked: ${category.name}"),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: "fab_categories",
        backgroundColor: AppColors.white,

        onPressed: () async {
          final newCategory = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddCategoryPage()),
          );

          if (newCategory != null && newCategory is Category) {
            setState(() {
              categories.add(newCategory);
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
