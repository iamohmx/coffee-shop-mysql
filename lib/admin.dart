import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.coffee_outlined),
        title: const Text("Admin Page"),
        centerTitle: true,
      ),
      body: Container(
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[800],
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        currentIndex: id,
        onTap: (value) {
          setState(() {
            id = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Customers',
          ),
        ],
      ),
    );
  }
}