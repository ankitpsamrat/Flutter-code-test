import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About page'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'About Me',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 250,
                  height: 300,
                  color: const Color.fromARGB(31, 158, 158, 158),
                  child: const Text(
                    'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.Flutter code compiles to ARM or Intel machine code as well as JavaScript, for fast performance on any device.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: 250,
                  height: 300,
                  color: const Color.fromARGB(31, 158, 158, 158),
                  child: const Text(
                    'Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.Flutter code compiles to ARM or Intel machine code as well as JavaScript, for fast performance on any device.',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
