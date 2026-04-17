import '../dummy/dummy_data.dart';
import '../models/product_model.dart';

class ProductRepository {
  List<Product> getAllProducts() {
    return DummyData.products;
  }

  List<Product> getProductsByCategory(String categoryId) {
    return DummyData.products.where((p) => p.categoryId == categoryId).toList();
  }

  double getTotalPriceByCategory(String categoryId) {
    final products = getProductsByCategory(categoryId);
    return products.fold(0, (sum, item) => sum + item.price);
  }
}
