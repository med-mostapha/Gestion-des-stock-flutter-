import 'package:gestion_de_stock_flutter/data/dummy/dummy_data.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';

class DummyCategoryRepository implements CategoryRepository {
  @override
  Future<List<Category>> getAllCategories() async {
    return DummyData.categories;
  }

  @override
  Future<void> addCategory(Category category) async {
    DummyData.categories.add(category);
  }

  @override
  Future<void> deleteCategory(String id) async {
    DummyData.categories.removeWhere((c) => c.id == id);
  }
}
