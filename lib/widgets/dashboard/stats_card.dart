import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:intl/intl.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final IconData icon;
  final Color iconbg;

  const StatsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.iconbg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 140,
        minHeight: 60,
        maxWidth: 160,
        maxHeight: 70,
      ),

      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 226, 226, 226),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(1, 1),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconbg,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: AppColors.white, size: 22),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                NumberFormat.compact().format(value),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(title, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
