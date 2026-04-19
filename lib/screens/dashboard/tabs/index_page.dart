import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/repositories/category_repository.dart';
import 'package:gestion_de_stock_flutter/data/repositories/product_repository.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';

class IndexPage extends StatelessWidget {
  IndexPage({super.key});

  final ProductRepository product_repo = ProductRepository();
  final CategoryRepository categoris_repo = CategoryRepository();
  @override
  Widget build(BuildContext context) {
    final products = product_repo.getAllProducts();
    final categoris = categoris_repo.getAllCategories();

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2,

      // crossAxisSpacing: 10,
      // mainAxisSpacing: 10,
      children: [
        StatsCard(
          title: "Products",
          subtitle: "",
          value: products.length + .0,
          icon: Icons.inventory,
          iconbg: AppColors.primary,
        ),
        StatsCard(
          title: "Category",
          subtitle: "",
          value: categoris.length + .0,
          icon: Icons.category,
          iconbg: CupertinoColors.activeOrange,
        ),
        const StatsCard(
          title: "Money",
          subtitle: "",
          value: 12059,
          icon: Icons.money_off_csred,
          iconbg: CupertinoColors.systemPurple,
        ),
        const StatsCard(
          title: "Wallet",
          subtitle: "",
          value: 4568,
          icon: Icons.wallet,
          iconbg: CupertinoColors.activeGreen,
        ),
      ],
    );
  }
}
