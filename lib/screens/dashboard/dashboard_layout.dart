import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/categories_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/index_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/products_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/settings_page.dart';
import 'package:provider/provider.dart';

import '../../providers/category_provider.dart';
import '../../providers/product_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int index = 0;

  final pages = [
    const IndexPage(),
    const ProductsPage(),
    const CategoriesPage(),
    const SettingsPage(),
  ];

  final titles = const ["Dashboard", "Products", "Categories", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(titles[index]),
        titleTextStyle: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        automaticallyImplyLeading: false,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          if (index != 3)
            IconButton(
              onPressed: () {
                switch (index) {
                  case 0:
                    context.read<ProductProvider>().loadProducts();
                    context.read<CategoryProvider>().loadCategories();
                    break;
                  case 1:
                    context.read<ProductProvider>().loadProducts();
                    break;
                  case 2:
                    context.read<CategoryProvider>().loadCategories();
                    break;
                }
              },
              icon: const Icon(
                Icons.refresh_rounded,
                color: AppColors.textPrimary,
              ),
            ),
        ],
      ),

      // IndexedStack keeps the state of each page alive
      body: IndexedStack(index: index, children: pages),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 12),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded),
              activeIcon: Icon(Icons.grid_view_rounded),
              label: "Overview",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2_outlined),
              activeIcon: Icon(Icons.inventory_2_rounded),
              label: "Products",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              activeIcon: Icon(Icons.category_rounded),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings_rounded),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
