import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';
import 'package:gestion_de_stock_flutter/widgets/ui/app_search_bar.dart';

final repo = ProductRepository();

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SearchBarApp(items: []),
    );
  }
}
