import 'package:code_test/screens/wheel_time_picker.dart';
import 'package:flutter/material.dart';

class WheelTimeUse extends StatelessWidget {
  const WheelTimeUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Time'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: WheelTimePicker(
          initialTime: TimeOfDay.now(),
          onTimeChanged: (newTime) {
            debugPrint(
                'Selected time: ${newTime.hour}:${newTime.minute}:${newTime.period.name}');
          },
        ),
      ),
    );
  }
}
