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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: "Products",
                      subtitle: "",
                      value: productProvider.totalProducts + .0,
                      icon: Icons.inventory,
                      iconbg: AppColors.primary,
                    ),
              categoryProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: "Categories",
                      subtitle: "",
                      value: categoryProvider.totalCategories + .0,
                      icon: Icons.category,
                      iconbg: CupertinoColors.activeOrange,
                    ),
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: "Stock Value",
                      subtitle: "MRU",
                      value: AnalyticsService.getTotalStockValue(
                        productProvider.products,
                      ),
                      icon: Icons.account_balance_wallet,
                      iconbg: AppColors.success,
                    ),
              productProvider.isLoading
                  ? _buildCardSkeleton()
                  : StatsCard(
                      title: "Low Stock",
                      subtitle: "alert",
                      value:
                          AnalyticsService.getLowStockProducts(
                            productProvider.products,
                          ).length +
                          .0,
                      icon: Icons.warning_amber_rounded,
                      iconbg: CupertinoColors.systemRed,
                    ),
            ],
          ),

          const SizedBox(height: 20),

          productProvider.isLoading || categoryProvider.isLoading
              ? _buildChartSkeleton(height: 250)
              : CategoryStockBarChart(
                  products: productProvider.products,
                  categories: categoryProvider.categories,
                ),

          const SizedBox(height: 16),

          productProvider.isLoading || categoryProvider.isLoading
              ? _buildChartSkeleton(height: 200)
              : CategoryPercentagePieChart(
                  products: productProvider.products,
                  categories: categoryProvider.categories,
                ),
        ],
      ),
    );
  }

  Widget _buildCardSkeleton() {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildChartSkeleton({required double height}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
