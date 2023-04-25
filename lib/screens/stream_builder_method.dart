import 'package:flutter/material.dart';

class StreamBuilderMethod extends StatefulWidget {
  const StreamBuilderMethod({super.key});

  @override
  State<StreamBuilderMethod> createState() => _StreamBuilderMethodState();
}

class _StreamBuilderMethodState extends State<StreamBuilderMethod> {
  //

  Stream<int> generateNumber() async* {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Builder'),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: generateNumber(),
            // initialData: 0,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //  if initial data are not available then use this 'if' condition to show any things

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Text(
                  snapshot.data.toString(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
