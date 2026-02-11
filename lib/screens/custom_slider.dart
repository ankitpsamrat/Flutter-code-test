import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double trackHeight;
  final double thumbSize;
  final ValueChanged<double> onChanged;

  const CustomSlider({
    super.key,
    required this.value,
    this.trackHeight = 20,
    this.thumbSize = 45,
    required this.onChanged,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  //

  double _value = 0.0;

  void _updateValue(Offset localPosition, double width) {
    double newValue = (localPosition.dx / width).clamp(0.0, 1.0);
    setState(() => _value = newValue);
    widget.onChanged(newValue);
  }

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            _updateValue(details.localPosition, width);
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Track
              Container(
                width: width,
                height: widget.trackHeight,
                margin: EdgeInsets.symmetric(vertical: widget.thumbSize / 2),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Active track
              Container(
                width: _value * width,
                height: widget.trackHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.green.shade200, Colors.green],
                  ),
                ),
              ),
              // Thumb
              Positioned(
                left: _value * (width - widget.thumbSize),
                child: Container(
                  width: widget.thumbSize,
                  height: widget.thumbSize,
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
