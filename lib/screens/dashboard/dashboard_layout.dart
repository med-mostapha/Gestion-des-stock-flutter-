import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/categories_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/index_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/products_page.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/tabs/settings_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => __DashboardPageState();
}

class __DashboardPageState extends State<DashboardPage> {
  int index = 0;

  final pages = [
    IndexPage(),
    const ProductsPage(),
    CategoriesPage(),
    const SettingsPage(),
  ];

  final titles = const ["Dashboard", "Products", "Categories", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[index]),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 223, 223, 223),

        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: IndexedStack(index: index, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
