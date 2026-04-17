import '../models/product_model.dart';
import '../models/category_model.dart';

class DummyData {
  static final categories = [
    Category(id: 'c1', name: 'Electronics'),
    Category(id: 'c2', name: 'Food'),
    Category(id: 'c3', name: 'Clothes'),
  ];

  static final products = [
    Product(id: 'p1', name: 'Laptop', price: 1200, categoryId: 'c1', stock: 5),
    Product(id: 'p2', name: 'Phone', price: 800, categoryId: 'c1', stock: 10),
    Product(id: 'p3', name: 'Apple', price: 2, categoryId: 'c2', stock: 100),
  ];
}
