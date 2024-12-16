import 'package:facein/core/colors.dart';
import 'package:facein/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 228, 196, 14),
        backgroundColor: AppColors.primaryColor,
        onTap: (value) {
          indexNotifier.value = value;
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add), label: 'Register'),
          BottomNavigationBarItem(icon: Icon(Icons.face_5), label: 'Scan'),
          BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Info'),
        ],
      ),
    );
  }
}
