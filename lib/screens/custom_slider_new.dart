import 'package:flutter/material.dart';

class CustomSliderNew extends StatelessWidget {
  final double value;
  final double trackHeight;
  final double thumbSize;
  final ValueChanged<double> onChanged;

  const CustomSliderNew({
    super.key,
    required this.value,
    this.trackHeight = 20,
    this.thumbSize = 45,
    required this.onChanged,
  });

  void _handleDrag(BuildContext context, Offset localPosition, double width) {
    double newValue = (localPosition.dx / width).clamp(0.0, 1.0);
    onChanged(newValue); // parent must update
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            _handleDrag(context, details.localPosition, width);
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Track
              Container(
                width: width,
                height: trackHeight,
                margin: EdgeInsets.symmetric(vertical: thumbSize / 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Active track
              Container(
                width: value * width,
                height: trackHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.green.shade200,
                      Colors.green,
                    ],
                  ),
                ),
              ),
              // Thumb
              Positioned(
                left: value * (width - thumbSize),
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
