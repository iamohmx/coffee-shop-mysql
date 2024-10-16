import 'package:flutter/material.dart';
import 'package:project01/admin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<dynamic> orders = []; // เปลี่ยนเป็นลิสต์ของข้อมูลคำสั่งซื้อ

  final IP = '192.168.210.230';

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  void getOrders() async {
    try {
      String url = "http://${IP}/coffeeshop/getOrders.php";
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });

      if (response.statusCode == 200) {
        var rs = response.body.replaceAll('ï»¿', '');
        var productData = convert.jsonDecode(rs);
        setState(() {
          orders = productData; // เก็บข้อมูลใน orders
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: orders.length, // ใช้ความยาวของ orders
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.5), // ปรับให้สวยงาม
          ),
          itemBuilder: (BuildContext context, int index) {
            var order = orders[index]; // เข้าถึงข้อมูลของแต่ละคำสั่งซื้อ
            double total = double.parse(order['order_qty']) * double.parse(order['pro_price']);
            int qty = int.parse(order['order_qty']);
            double price = double.parse(order['pro_price']);
            return Card(
              elevation: 4, // เพิ่มเงาให้กรอบ
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminPage(
                        // ส่งข้อมูลที่ต้องการที่นี่
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // ลด Padding ของ Card
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // ทำให้ Column เล็กลง
                    children: [
                      SizedBox(height: 15), // เพิ่มพื้นที่ว่าง
                      Image.network(
                        'http://${IP}/coffeeshop/${order['pro_image']}',
                        height: 80, // ลดขนาดของภาพ
                        width: 80,
                      ),
                      SizedBox(height: 8),
                      Text(
                        order['pro_name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14, // ลดขนาดตัวอักษร
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('ราคา : ${price.toStringAsFixed(2)} บาท'),
                      Text('จำนวน : ${order['order_qty']}'),
                      Text('ยอดรวม : ${total.toStringAsFixed(2)} บาท'),
                      Text('ลูกค้า : ${order['username']}'),
                      Text('วันที่ : ${order['ordertime']}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
