import 'package:flutter/material.dart';

class WheelTimePicker extends StatefulWidget {
  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;

  const WheelTimePicker({
    super.key,
    required this.initialTime,
    required this.onTimeChanged,
  });

  @override
  State<WheelTimePicker> createState() => _WheelTimePickerState();
}

class _WheelTimePickerState extends State<WheelTimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _amPmController;

  late int _selectedHour; // 1-12
  late int _selectedMinute; // 0-59
  late int _selectedAmPm; // 0 for AM, 1 for PM

  final List<String> _hours = List.generate(
    12,
    (index) => (index + 1).toString().padLeft(2, '0'),
  ); // 01 to 12
  final List<String> _minutes = List.generate(
    60,
    (index) => index.toString().padLeft(2, '0'),
  ); // 00 to 59
  final List<String> _amPm = ['AM', 'PM'];

  // Keep track of the currently centered index for each wheel to apply bold style
  int _currentHourIndex = 0;
  int _currentMinuteIndex = 0;
  int _currentAmPmIndex = 0;

  void _onTimeChanged() {
    final int hour24 = _selectedAmPm == 0
        ? (_selectedHour == 12
            ? 0
            : _selectedHour) // Convert 12 AM to 0, others stay
        : (_selectedHour == 12
            ? 12
            : _selectedHour + 12); // Convert 12 PM to 12, others add 12

    final newTime = TimeOfDay(hour: hour24, minute: _selectedMinute);
    widget.onTimeChanged(newTime);
  }

  Widget _buildTimeWheel({
    required FixedExtentScrollController controller,
    required List<String> items,
    required ValueChanged<int> onSelectedItemChanged,
    required int
        currentIndex, // The index of the currently centered item for styling
  }) {
    const double itemHeight = 40.0; // Height of each item in the wheel

    return SizedBox(
      width: items.length > 2
          ? 55
          : 60, // Wider for hours/minutes, narrower for AM/PM
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: itemHeight,
        magnification: 1.2, // Make selected item slightly larger
        useMagnifier: true,
        overAndUnderCenterOpacity: 0.5, // Fading effect for non-selected items
        physics: const FixedExtentScrollPhysics(), // Snaps to items
        perspective: 0.003, // Slight 3D perspective
        onSelectedItemChanged: (index) {
          setState(() {
            onSelectedItemChanged(index);
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final isSelected = index == currentIndex;
            return Center(
              child: Text(
                items[index %
                    items
                        .length], // Use modulo for infinite scrolling if needed, though not strictly required for fixed lists
                style: TextStyle(
                  fontSize: isSelected
                      ? 22
                      : 22, // Larger for selected, smaller for others
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? Colors.black
                      : Colors.grey, // Darker for selected
                ),
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _selectedHour = widget.initialTime.hourOfPeriod == 0
        ? 12
        : widget.initialTime.hourOfPeriod; // Handle 0 (midnight) as 12 AM/PM
    _selectedMinute = widget.initialTime.minute;
    _selectedAmPm = widget.initialTime.period == DayPeriod.am ? 0 : 1;

    _hourController = FixedExtentScrollController(
      initialItem: _selectedHour - 1,
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute,
    );
    _amPmController = FixedExtentScrollController(initialItem: _selectedAmPm);

    // Initialize current indices for styling
    _currentHourIndex = _selectedHour - 1;
    _currentMinuteIndex = _selectedMinute;
    _currentAmPmIndex = _selectedAmPm;
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _amPmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 400, // Overall width of the picker
      height: 120, // Overall height of the picker
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Vertical Tick Marks Left
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => Container(
                  width: (index == 2) ? 25 : 10,
                  height: 1,
                  color: (index == 2) ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          // Vertical Tick Marks Right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                5,
                (index) => Container(
                  width: (index == 2) ? 25 : 10,
                  height: 1,
                  color: (index == 2) ? Colors.black : Colors.grey,
                ),
              ),
            ),
          ),
          // Time Pickers Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeWheel(
                controller: _hourController,
                items: _hours,
                onSelectedItemChanged: (index) {
                  _selectedHour = int.parse(_hours[index]);
                  _currentHourIndex = index;
                  _onTimeChanged();
                },
                currentIndex: _currentHourIndex,
              ),
              const Text(
                ':',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              _buildTimeWheel(
                controller: _minuteController,
                items: _minutes,
                onSelectedItemChanged: (index) {
                  _selectedMinute = int.parse(_minutes[index]);
                  _currentMinuteIndex = index;
                  _onTimeChanged();
                },
                currentIndex: _currentMinuteIndex,
              ),
              const Text(
                ':',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              _buildTimeWheel(
                controller: _amPmController,
                items: _amPm,
                onSelectedItemChanged: (index) {
                  _selectedAmPm = index;
                  _currentAmPmIndex = index;
                  _onTimeChanged();
                },
                currentIndex: _currentAmPmIndex,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
