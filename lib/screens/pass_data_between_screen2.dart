import 'package:flutter/material.dart';

class InputDataScreen extends StatefulWidget {
  const InputDataScreen({Key? key}) : super(key: key);

  @override
  State<InputDataScreen> createState() => _InputDataScreenState();
}

class _InputDataScreenState extends State<InputDataScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            controller: myController,
            decoration: InputDecoration(labelText: 'Enter Fruit Name'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // passing data here
                  builder: (context) => DetailScreen(title: myController.text),
                ),
              );
            },
            child: const Text(
              'Pass Data To Next Screen',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatefulWidget {
  // create variable to receive data
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              widget.title,
              style: TextStyle(fontSize: 54),
            ),
          ],
        ),
      ),
    );
  }
}
