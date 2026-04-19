import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/dashboard_layout.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/signup_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupPage());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
