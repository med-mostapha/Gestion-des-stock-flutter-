import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';
import 'package:gestion_de_stock_flutter/widgets/products/product_card.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/app_search_bar.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductRepository repository = ProductRepository();

  late List<Product> products;
  List<Product> filtered = [];

  @override
  void initState() {
    super.initState();
    products = repository.getAllProducts();
    filtered = products;
  }

  void search(String query) {
    setState(() {
      filtered = products
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarApp(onChanged: search),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              return ProductCard(product: filtered[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
          ),
        ),
      ],
    );
  }
}
