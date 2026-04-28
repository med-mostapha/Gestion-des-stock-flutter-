import '../models/product_model.dart';
import '../models/category_model.dart';

class DummyData {
  static final List<Category> categories = [
    Category(
      id: 'c1',
      name: 'Electronics',
      description: 'Electronic devices and gadgets',
    ),
    Category(id: 'c2', name: 'Food', description: 'Food and consumables'),
    Category(id: 'c3', name: 'Clothes', description: 'Clothing and fashion'),
  ];

  static final List<Product> products = [
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
      name: 'Headphones',
      price: 150,
      stock: 2,
      minStock: 5,
      categoryId: 'c1',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p4',
      name: 'Apple',
      price: 2,
      stock: 100,
      minStock: 20,
      categoryId: 'c2',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p5',
      name: 'Orange',
      price: 5,
      stock: 70,
      minStock: 25,
      categoryId: 'c2',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p6',
      name: 'Milk',
      price: 3,
      stock: 50,
      minStock: 10,
      categoryId: 'c2',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p7',
      name: 'T-Shirt',
      price: 25,
      stock: 30,
      minStock: 10,
      categoryId: 'c3',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p8',
      name: 'Jeans',
      price: 60,
      stock: 0,
      minStock: 5,
      categoryId: 'c3',
      createdAt: DateTime.now(),
    ),
    Product(
      id: 'p9',
      name: 'Jacket',
      price: 120,
      stock: 8,
      minStock: 4,
      categoryId: 'c3',
      createdAt: DateTime.now(),
    ),
  ];
}
