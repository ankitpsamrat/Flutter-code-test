import 'package:flutter/material.dart';

class MaterialDesign extends StatelessWidget {
  const MaterialDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Examples(),
    );
  }
}

class Examples extends StatelessWidget {
  const Examples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Design')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            Switch(value: true, onChanged: (value) {}),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outline Button'),
            ),
            const Text('Material Design'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
