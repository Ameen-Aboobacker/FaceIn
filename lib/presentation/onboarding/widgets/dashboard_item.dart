import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  const DashboardItem(
      {super.key,
      required this.onTap,
      required this.color,
      required this.icon,
      required this.title,
      this.iconSize = 40,
      this.titleSize = 16,
      this.fontWeight = FontWeight.normal,
      });

  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final String title;
  final double iconSize;
  final double titleSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: iconSize, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: titleSize,
                  color: Colors.white,
                  fontWeight: fontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
