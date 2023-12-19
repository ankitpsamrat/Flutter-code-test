import 'package:flutter/material.dart';

class DottedLineScreen extends StatelessWidget {
  const DottedLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DottedLine(
          direction: LineDirection.vertical,
        ),
      ),
    );
  }
}

/////   dotted line core code starting from here //////

enum LineDirection {
  horizontal,
  vertical,
}

class DottedLine extends StatelessWidget {
  final LineDirection direction;
  final Color color;
  final double stroke;
  final double width;
  final double space;
  final EdgeInsetsGeometry margin;

  const DottedLine({
    required this.direction,
    this.color = Colors.black,
    this.stroke = 2.0,
    this.width = 5.0,
    this.space = 5.0,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: (direction == LineDirection.horizontal) ? 0 : double.infinity,
      width: (direction == LineDirection.horizontal) ? double.infinity : 0,
      child: CustomPaint(
        painter: DottedLinePainter(
          direction: direction,
          color: color,
          stroke: stroke,
          width: width,
          space: space,
        ),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final LineDirection direction;
  final Color color;
  final double stroke;
  final double width;
  final double space;

  DottedLinePainter({
    required this.direction,
    required this.color,
    required this.stroke,
    required this.width,
    required this.space,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    double dashWidth = width;
    double dashSpace = space;

    if (direction == LineDirection.vertical) {
      double startY = 0.0;
      double endY = size.height;

      while (startY < endY) {
        canvas.drawLine(
          Offset(0, startY),
          Offset(0, startY + dashWidth),
          paint,
        );
        startY += dashWidth + dashSpace;
      }
    } else {
      double startX = 0.0;
      double endX = size.width;

      while (startX < endX) {
        canvas.drawLine(
          Offset(startX, 0),
          Offset(startX + dashWidth, 0),
          paint,
        );
        startX += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
