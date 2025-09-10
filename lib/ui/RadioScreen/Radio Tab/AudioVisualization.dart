import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:io';


class AudioVisualization extends StatefulWidget {
  const AudioVisualization({super.key});

  @override
  _AudioVisualizationState createState() => _AudioVisualizationState();
}

class _AudioVisualizationState extends State<AudioVisualization>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(15, (index) {
            double height = 4 +
                (20 *
                    (0.5 +
                        0.5 *
                            (1 +
                                math.sin((_controller.value * 2 * math.pi) +
                                    (index * 0.5)))));
            return Container(
              width: 3,
              height: height,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(1.5),
              ),
            );
          }),
        );
      },
    );
  }
}

class FullBottomMosquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final path = Path();

    double width = size.width;
    double height = size.height;

    path.moveTo(0, height);

    path.lineTo(width * 0.05, height);
    path.lineTo(width * 0.05, height * 0.3);
    path.lineTo(width * 0.08, height * 0.3);
    path.lineTo(width * 0.08, height * 0.2);
    path.addOval(Rect.fromCenter(
      center: Offset(width * 0.065, height * 0.15),
      width: width * 0.03,
      height: height * 0.1,
    ));
    path.moveTo(width * 0.08, height * 0.3);
    path.lineTo(width * 0.1, height * 0.3);
    path.lineTo(width * 0.1, height);

    path.lineTo(width * 0.2, height);
    path.lineTo(width * 0.2, height * 0.5);

    path.quadraticBezierTo(
      width * 0.25,
      height * 0.3,
      width * 0.3,
      height * 0.5,
    );

    path.lineTo(width * 0.35, height * 0.4);

    path.quadraticBezierTo(
      width * 0.5,
      height * 0.1,
      width * 0.65,
      height * 0.4,
    );

    path.lineTo(width * 0.7, height * 0.5);

    path.quadraticBezierTo(
      width * 0.75,
      height * 0.3,
      width * 0.8,
      height * 0.5,
    );

    path.lineTo(width * 0.8, height);
    path.lineTo(width * 0.9, height);
    path.lineTo(width * 0.9, height * 0.3);
    path.lineTo(width * 0.92, height * 0.3);
    path.lineTo(width * 0.92, height * 0.2);
    path.addOval(Rect.fromCenter(
      center: Offset(width * 0.935, height * 0.15),
      width: width * 0.03,
      height: height * 0.1,
    ));
    path.moveTo(width * 0.92, height * 0.3);
    path.lineTo(width * 0.95, height * 0.3);
    path.lineTo(width * 0.95, height);

    path.lineTo(width, height);

    path.close();

    canvas.drawPath(path, paint);

    final detailPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(width * 0.15, height * 0.4),
        width: width * 0.08,
        height: height * 0.15,
      ),
      detailPaint,
    );

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(width * 0.85, height * 0.4),
        width: width * 0.08,
        height: height * 0.15,
      ),
      detailPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
