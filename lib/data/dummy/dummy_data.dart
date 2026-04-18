import '../models/product_model.dart';
import '../models/category_model.dart';

class DummyData {
  static final categories = [
    Category(
      id: 'c1',
      name: 'Electronics',
      description: 'Electronic devices and gadgets',
    ),
    Category(id: 'c2', name: 'Food', description: 'Food and consumables'),
    Category(id: 'c3', name: 'Clothes', description: 'Clothing and fashion'),
  ];

  static final products = [
    Product(
      id: 'p1',
      name: 'Laptop',
      price: 1200,
      stock: 5,
      minStock: 3,
      categoryId: 'c1',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p2',
      name: 'Phone',
      price: 800,
      stock: 10,
      minStock: 5,
      categoryId: 'c1',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p3',
      name: 'Apple',
      price: 2,
      stock: 100,
      minStock: 20,
      categoryId: 'c2',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p4',
      name: 'Orange',
      price: 5,
      stock: 70,
      minStock: 25,
      categoryId: 'c2',
      createdAt: DateTime.now(),
    ),
  ];
}
