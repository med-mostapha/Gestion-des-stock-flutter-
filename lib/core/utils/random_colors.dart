import 'dart:math';
import 'package:flutter/material.dart';

class AppRandomColors {
  static const List<Color> colors = [
    Color.fromARGB(255, 180, 175, 245), // soft purple
    Color(0xFF81ECEC), // soft cyan
    Color.fromARGB(255, 189, 215, 241), // soft blue
    Color(0xFF55EFC4), // soft green
    Color.fromARGB(255, 239, 129, 85),
  ];

  static Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}
