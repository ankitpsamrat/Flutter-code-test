import 'package:flutter/material.dart';

class ValueNotifierTest extends StatefulWidget {
  const ValueNotifierTest({Key? key}) : super(key: key);

  @override
  State<ValueNotifierTest> createState() => _ValueNotifierTestState();
}

class _ValueNotifierTestState extends State<ValueNotifierTest> {
   ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    counterNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('HOMEPAGE BUILT');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Counter App'),
      ),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: counterNotifier,
          builder: (context, value, _) {
            return Text('Count: $value');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterNotifier.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
