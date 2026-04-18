class Product {
  final String id;
  final String name;
  final double price;
  final int stock;

  final int minStock;
  final String categoryId;

  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.categoryId,
    required this.createdAt,
  });
}
