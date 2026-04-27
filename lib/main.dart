import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_theme.dart';
import 'package:gestion_de_stock_flutter/routes/app_router.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.main,
      onGenerateRoute: AppRouter.generateRoute,

      theme: AppTheme.lightTheme,
    );
  }
}
