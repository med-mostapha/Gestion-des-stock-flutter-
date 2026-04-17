import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/widgets/dashboard/stats_card.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children: const [
        StatsCard(
          title: "Products",
          subtitle: "",
          value: 120,
          icon: Icons.inventory,
          iconbg: AppColors.primary,
        ),
        StatsCard(
          title: "Category",
          subtitle: "",
          value: 25,
          icon: Icons.category,
          iconbg: CupertinoColors.activeGreen,
        ),
        StatsCard(
          title: "money",
          subtitle: "",
          value: 12059,
          icon: Icons.money_off_csred,
          iconbg: CupertinoColors.systemPurple,
        ),
        StatsCard(
          title: "Products",
          subtitle: "",
          value: 4568,
          icon: Icons.inventory,
          iconbg: CupertinoColors.black,
        ),
      ],
    );
  }
}
