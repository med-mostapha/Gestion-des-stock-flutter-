import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/repositories/dummy_product_repository.dart';
import '../data/models/product_model.dart';
import '../data/repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository = DummyProductRepository();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(
        const Duration(seconds: 2),
      ); // simulator I will delete this latter
      _products = await _repository.getAllProducts();
    } catch (e) {
      _error = "Failed to load products";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  int get totalProducts => _products.length;

  int get lowStockCount =>
      _products.where((p) => p.stock <= p.minStock && p.stock > 0).length;

  int get outOfStockCount => _products.where((p) => p.stock <= 0).length;

  double get totalStockValue =>
      _products.fold(0, (sum, p) => sum + (p.price * p.stock));

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  // this methode not work now because we use Dummy data
  void updateProduct(String id, Product updatedProduct) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = updatedProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  List<Product> search(String query) {
    return _products
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
