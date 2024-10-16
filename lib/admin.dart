import 'package:flutter/material.dart';
import 'package:project01/routes/customer.dart';
import 'package:project01/routes/order.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  


  int id = 0; // ตัวแปรเก็บ index ของหน้า
  var title = ['Orders', 'Customers'];

  // สร้างลิสต์ของ Widget สำหรับหน้า Order และ Customer
  final List<Widget> pages = [
    OrderPage(), // เปลี่ยน OrderPage มาอยู่ที่ index 0
    CustomerPage(),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.coffee_outlined),
      //   title: Text("Admin Page"),
      //   centerTitle: true,
      // ),
      body: pages[id], // แสดงหน้าใน body ตาม index
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber[800],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: id,
        onTap: (value) {
          setState(() {
            id = value; // เปลี่ยน index เมื่อคลิก
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
