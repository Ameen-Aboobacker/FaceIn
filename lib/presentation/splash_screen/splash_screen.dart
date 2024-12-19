import 'dart:async';

import 'package:facein/presentation/onboarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AnimatedScaffold extends StatefulWidget {
  const AnimatedScaffold({super.key});

  @override
  State<AnimatedScaffold> createState() => _AnimatedScaffoldState();
}

class _AnimatedScaffoldState extends State<AnimatedScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Timer(const Duration(milliseconds: 5200), () {
      Navigator.of(context).push(
        CustomPageRoute(page: const OnBoardingScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: _animation,
              child: child,
            );
          },
          child:
              Image.asset('assets/images/FaceIn.png', height: 300, width: 300),
        ),
      ),
      bottomNavigationBar: const Text(
        'Face In',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            const Offset beginOffset = Offset(1.0, 0.0); // Custom function

            const Offset endOffset = Offset.zero; // Slide in from the right

            // Create a Tween<Offset> to animate the position smoothly
            final tween = Tween<Offset>(begin: beginOffset, end: endOffset)
                .animate(animation);
            return SlideTransition(
              position: tween,
              child: child,
            );
          },
        );
}
