import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          print("pressed");
        },
        onLongPress: () => print("login press..."),
        color: Colors.blue,
        minWidth: 300,
        height: 40,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),

        child: const Text("click me"),
      ),
    );
  }
}
