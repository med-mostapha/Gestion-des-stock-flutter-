import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_theme.dart';
import 'package:gestion_de_stock_flutter/providers/category_provider.dart';
import 'package:gestion_de_stock_flutter/providers/product_provider.dart';
import 'package:gestion_de_stock_flutter/routes/app_router.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        initialRoute: AppRoutes.dashboard,
        onGenerateRoute: AppRouter.generateRoute,

        theme: AppTheme.lightTheme,
      ),
    );
  }
}
