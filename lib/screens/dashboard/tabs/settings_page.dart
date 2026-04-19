import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  int i = 0;
  bool darkMode = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 226, 226, 226),
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: SwitchListTile(
            title: Text(
              "Darck Mode",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            value: darkMode,
            activeTrackColor: Colors.green,
            inactiveTrackColor: Colors.grey,
            activeThumbColor: Colors.white,
            inactiveThumbColor: Colors.white,

            onChanged: (val) {
              setState(() {
                darkMode = val;
              });
            },
          ),
        ),
        MaterialButton(
          minWidth: 100,
          height: 40,
          color: const Color.fromARGB(255, 230, 117, 115),

          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                "Logout",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.logout, color: Colors.white, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
