import 'package:flutter/material.dart';
import 'package:project01/routes/coffeeDetail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class CoffeePage extends StatefulWidget {
  const CoffeePage({super.key, required this.username, required this.user_id});

  final String username, user_id;

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {
  var pro_id = [];
  var pro_name = [];
  var pro_price = [];
  var pro_image = [];
  var pro_desc = [];

  int id = 0;

  // final IP = '10.34.5.12';
  final IP = '192.168.210.230';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  void getProducts() async {
    try {
      String url = "http://${IP}/coffeeshop/getProducts.php";

      print(url);
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });
      if (response.statusCode == 200) {
        var rs = response.body.replaceAll('ï»¿', '');
        var productData = convert.jsonDecode(rs);

        productData.forEach((item) {
            // setState(() {
              pro_id.add(item['pro_id']);
              pro_name.add(item['pro_name']);
              pro_price.add(item['pro_price']);
              pro_image.add(item['pro_image']);
              // pro_desc.add(item['pro_desc']);
            // });
          });
          print(productData);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
    }
  }
 
  //   'กาแฟมอคค่า',
  //   'กาแฟดอกไม้',
  //   'กาแฟแมวยิ้ม',
  //   'กาแฟกระต่ายอ้วน',
  //   'กาแฟหมาโดนหยิก',
  //   'กาแฟแมวอินเลิฟ',
  //   'กาแฟแมวกินพิซซ่า',
  //   'กาแฟแมวงง',
  //   'กาแฟแมวอ้าปาก',
  //   'กาแฟร้อน',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Menu"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: pro_id.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoffeeDetail(
                        pro_id: pro_id[index],
                        pro_name: pro_name[index],
                        pro_price: pro_price[index],
                        pro_image: pro_image[index],
                        username: widget.username,
                        user_id: widget.user_id.toString()
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ), 
                    Text(pro_id[index]),
                    // Text()
                    Image.network(
                      'http://${IP}/coffeeshop/${pro_image[index]}',
                      // pro_image[index],
                      height: 280, width: 120, 
                      // fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        pro_name[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(pro_name[index]),
                    Text('${pro_price[index]} Baht'),
                    // Text(pro_desc[index]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 134, 114, 87),
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
            icon: Icon(Icons.payment),
            label: 'Checkout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}