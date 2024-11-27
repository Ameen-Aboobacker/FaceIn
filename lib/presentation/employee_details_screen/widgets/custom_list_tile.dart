import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.leading,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.tileColor,
     required this.onTap,
  });

  final Widget leading;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Color tileColor;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 12, 5, 12),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leading,
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleTextStyle),
                  Text(subtitle, style: subtitleTextStyle),
                ],
              ),
            ),
            trailing
          ],
        ),
      ),
    );
  }
}
