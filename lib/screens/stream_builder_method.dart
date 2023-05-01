import 'package:flutter/material.dart';

class StreamBuilderMethod extends StatelessWidget {
  const StreamBuilderMethod({super.key});

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
        elevation: 0,
        title: Text('Stream Builder'),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: generateNumber(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Text(
                    snapshot.data.toString(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
