import 'package:dealsdray_task/sign_up.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: SignUp(),
  ));
}
/*
* MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Circular Dotted Progress Bar')),
      body: Center(child: CircularDottedProgressBar()),
    ),
  )
* */
class CircularDottedProgressBar extends StatefulWidget {
  const CircularDottedProgressBar({super.key});

  @override
  _CircularDottedProgressBarState createState() =>
      _CircularDottedProgressBarState();
}

class _CircularDottedProgressBarState extends State<CircularDottedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(); // Repeats the progress animation
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return CustomPaint(
          painter: DottedCircularProgressPainter(_controller!.value),
          child: const SizedBox(
            width: 100,
            // Ensure width and height are the same for a perfect circle
            height: 100,
          ),
        );
      },
    );
  }
}

class DottedCircularProgressPainter extends CustomPainter {
  final double progress;
  final int numDots = 12; // Number of dots around the circle

  DottedCircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        min(size.width, size.height) / 2 - 10; // Ensure proper radius

    for (int i = 0; i < numDots; i++) {
      // Calculate angle and position of each dot
      double angle = (2 * pi / numDots) * i;
      double x = center.dx + radius * cos(angle);
      double y = center.dy + radius * sin(angle);

      // Set color for active and inactive dots
      if (i < progress * numDots) {
        paint.color = Colors.red; // Active dots color
      } else {
        paint.color = Colors.red.withOpacity(0.3); // Inactive dots color
      }

      // Draw each dot
      canvas.drawCircle(Offset(x, y), 8, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
