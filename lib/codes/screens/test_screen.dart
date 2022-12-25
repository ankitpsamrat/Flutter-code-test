import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
            color: Colors.teal,
            gradient: const LinearGradient(
              colors: [Colors.yellow, Colors.pink],
            ),
          ),
          width: 100,
          height: 100,
          child: const Text(
            "Samrat",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
