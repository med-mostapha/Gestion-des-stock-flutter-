import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/data/%20services/analytics_service.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';
import 'package:gestion_de_stock_flutter/data/models/product_model.dart';

class CategoryPercentagePieChart extends StatelessWidget {
  final List<Product> products;
  final List<Category> categories;

  const CategoryPercentagePieChart({
    super.key,
    required this.products,
    required this.categories,
  });

  static const List<Color> _colors = [
    AppColors.primary,
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF4CAF50),
    Color(0xFFE91E63),
    Color(0xFF00BCD4),
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, double> data = AnalyticsService.getStockValuePerCategory(
      products,
      categories,
    );

    final filtered = Map.fromEntries(data.entries.where((e) => e.value > 0));

    if (filtered.isEmpty) {
      return const Center(child: Text("No data"));
    }

    final total = filtered.values.fold(0.0, (sum, v) => sum + v);
    final entries = filtered.entries.toList();

    final sections = List.generate(entries.length, (index) {
      // final percentage = (entries[index].value / total) * 100;
      return PieChartSectionData(
        value: entries[index].value,
        color: _colors[index % _colors.length],
        radius: 60,
        showTitle: false,
      );
    });

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Stock Distribution",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.textPrimary,
            ),
          ),
          const Text(
            "by category value",
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              SizedBox(
                height: 160,
                width: 160,
                child: PieChart(
                  PieChartData(
                    sections: sections,
                    centerSpaceRadius: 20,
                    sectionsSpace: 3,
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(entries.length, (index) {
                    final percentage = (entries[index].value / total * 100)
                        .toStringAsFixed(1);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: _colors[index % _colors.length],
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              entries[index].key,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "$percentage%",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
