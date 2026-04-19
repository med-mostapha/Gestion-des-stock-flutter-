import 'dart:math';
import 'package:flutter/material.dart';

class AppRandomColors {
  static const List<Color> colors = [
    Color.fromARGB(255, 200, 197, 252), // soft purple
    Color.fromARGB(255, 199, 247, 247), // soft cyan
    Color.fromARGB(255, 213, 233, 253), // soft blue
    Color.fromARGB(255, 213, 250, 239), // soft green
    Color.fromARGB(255, 253, 205, 186),
  ];

  static Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}
