import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';

import '../../../data/ services/analytics_service.dart';
import '../../../widgets/charts/category_percentage_pie_chart.dart';
import '../../../widgets/charts/category_stock_bar_chart.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final categoryProvider = context.watch<CategoryProvider>();

    final isLoading = productProvider.isLoading || categoryProvider.isLoading;

    final totalStockValue = AnalyticsService.getTotalStockValue(
      productProvider.products,
    );

    final lowStock = AnalyticsService.getLowStockProducts(
      productProvider.products,
    ).length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child:
          // isLoading
          //     ? _buildChartsSkeleton()
          //     :
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  StatsCard(
                    title: "Products",
                    subtitle: "",
                    value: productProvider.totalProducts + .0,
                    icon: Icons.inventory,
                    iconbg: AppColors.primary,
                  ),
                  StatsCard(
                    title: "Categories",
                    subtitle: "",
                    value: categoryProvider.totalCategories + .0,
                    icon: Icons.category,
                    iconbg: CupertinoColors.activeOrange,
                  ),
                  StatsCard(
                    title: "Stock Value",
                    subtitle: "MRU",
                    value: totalStockValue,
                    icon: Icons.account_balance_wallet,
                    iconbg: AppColors.success,
                  ),
                  StatsCard(
                    title: "Low Stock",
                    subtitle: "alert",
                    value: lowStock + .0,
                    icon: Icons.warning_amber_rounded,
                    iconbg: CupertinoColors.systemRed,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //bar chart
              CategoryStockBarChart(
                products: productProvider.products,
                categories: categoryProvider.categories,
              ),

              const SizedBox(height: 16),

              CategoryPercentagePieChart(
                products: productProvider.products,
                categories: categoryProvider.categories,
              ),
            ],
          ),
    );
  }

  Widget _buildChartsSkeleton() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
