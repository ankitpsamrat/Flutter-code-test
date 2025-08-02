import 'package:code_test/helpers/custom_slider.dart';
import 'package:flutter/material.dart';

class SliderExplore extends StatefulWidget {
  const SliderExplore({Key? key}) : super(key: key);

  @override
  State<SliderExplore> createState() => _SliderExploreState();
}

class _SliderExploreState extends State<SliderExplore> {
  //
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Slider'),
      ),
      body: Column(
        children: [
          Text('Value: $_sliderValue'),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: 1.0,
            onChanged: (value) {
              setState(() {
                if (value <= 0.8 && value >= 0.3) {
                  _sliderValue = value;
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: CustomSlider(
              value: 0.5,
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
