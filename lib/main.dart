import 'package:flutter/material.dart';
import 'screens/value_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Code Test',
      // home: HomePage(),
      // home: profile(),
      // home: HomePage1(),
      // home: HomePage2(),
      // home: About(),
      // home: TopSkills(),
      // home: StreamBuilderMethod(),
      // home: MaterialDesign(),
      home: ValueNotifierTest(),
    );
  }
}
