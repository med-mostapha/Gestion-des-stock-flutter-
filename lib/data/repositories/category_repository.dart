import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();
  Future<void> addCategory(Category category);
  Future<void> deleteCategory(String id);
}
