import 'package:code_test/screens/animated_floating_btn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      // home: DottedLineScreen(),
      // home: AnimatedSearchBar(),
      home: AnimatedFloatingButton(),
    );
  }
}
