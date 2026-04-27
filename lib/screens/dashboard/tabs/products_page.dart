import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/add_product_page.dart';
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

  // Delete Product confirm
  void _confirmDelete(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Delete Product"),
          content: Text("Are you sure you want to delete '${product.name}'?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
              onPressed: () {
                setState(() {
                  products.removeWhere((p) => p.id == product.id);
                  filtered = products;
                });
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.name} deleted")),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Column(
        children: [
          SearchBarApp(onChanged: search),

          /// total status
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Products: ${filtered.length}",
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.filter_list, color: AppColors.primary),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Products list
          Expanded(
            child: filtered.isEmpty
                ? _buildEmptyState()
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.72,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final product = filtered[index];
                      return ProductCard(
                        product: product,
                        onTap: () {},
                        onLongPress: () => _confirmDelete(product),
                      );
                    },
                  ),
          ),
        ],
      ),

      // add new product btn
      floatingActionButton: FloatingActionButton(
        heroTag: "fab_products",
        onPressed: () async {
          final newProduct = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductPage()),
          );

          if (newProduct != null && newProduct is Product) {
            setState(() {
              products.add(newProduct);
              filtered = products;
            });
          }
        },
        backgroundColor: AppColors.primary,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inventory_2_outlined, size: 80, color: AppColors.border),
          const SizedBox(height: 16),
          const Text(
            "No products found",
            style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
