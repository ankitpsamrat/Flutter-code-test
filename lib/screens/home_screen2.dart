import 'package:flutter/material.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Hello App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/mypic.png',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Change me",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Input somthings",
                      labelText: "Name",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Ankit Pratap Samrat"),
              accountEmail: const Text("ankit.p.samrat@gmail.com"),
              currentAccountPicture: Image.asset('assets/images/mypic.jpg'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text("ABOUT"),
              subtitle: Text("User"),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text("ankit.p.samrat@gmail.com"),
              trailing: Icon(Icons.send),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("+91 7523878181"),
              trailing: Icon(Icons.call),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
