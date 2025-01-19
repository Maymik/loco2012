import 'package:flutter/material.dart';

class FootballLoadingIndicator extends StatefulWidget {
  const FootballLoadingIndicator({super.key, this.size = 50.0});

  final double size;

  @override
  FootballLoadingIndicatorState createState() =>
      FootballLoadingIndicatorState();
}

class FootballLoadingIndicatorState extends State<FootballLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * 3.1416,
            child: child,
          );
        },
        child: Image.asset(
          'assets/app_icon.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
