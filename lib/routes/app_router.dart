import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/screens/dashboard/dashboard_layout.dart';
import 'package:gestion_de_stock_flutter/screens/onboarding/main_page.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/signup_page.dart';
import 'app_routes.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainPage());

      case AppRoutes.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionDuration: Duration.zero,
        );

      case AppRoutes.signup:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignUpPage(),
          transitionDuration: Duration.zero,
        );

      case AppRoutes.dashboard:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const DashboardPage(),
          transitionDuration: Duration.zero,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
