import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/repositories/dummy_category_repository.dart';
import '../data/models/category_model.dart';
import '../data/repositories/category_repository.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepository _repository = DummyCategoryRepository();

  List<Category> _categories = [];
  bool _isLoading = false;
  String? _error;

  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(
        const Duration(seconds: 1),
      ); // simulator don't forgat to delete this.
      _categories = await _repository.getAllCategories();
    } catch (e) {
      _error = "Failed to load categories";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  int get totalCategories => _categories.length;

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(String id, Category updatedCategory) {
    final index = _categories.indexWhere((c) => c.id == id);
    if (index != -1) {
      _categories[index] = updatedCategory;
      notifyListeners();
    }
  }

  void deleteCategory(String id) {
    _categories.removeWhere((c) => c.id == id);
    notifyListeners();
  }
}
