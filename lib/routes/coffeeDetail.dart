import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key, required this.pro_image, required this.pro_name, required this.pro_price, required this.pro_id, required this.username, required this.user_id});

  final String pro_image, pro_name, username, user_id, pro_id, pro_price;


  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  final IP = '10.34.5.12';

  void InsertOrder(String user_id, String pro_id, String order_qty) async {
    try {
      String url = 'http://$IP/coffeeshop/insertOrder.php?user_id=$user_id&pro_id=$pro_id&order_qty=$order_qty';

      print(url);
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });
      if (response.statusCode == 200) {
        var rs = response.body.replaceAll('ï»¿', '');
        var rsInsert = convert.jsonDecode(rs);
        String resultInsert = rsInsert['order'];

        if (resultInsert.contains('OK')) {
          print('Insert Order Successfully!');
        } else {
          print('Insert Order Failed!');
        }

        setState(() {
          InsertOrder(user_id, pro_id, order_qty);
        });

      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
    }
  }
  // var detail = [
  //   'มอคค่า อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟดอกไม้ อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟแมวยิ้ม อร่อยจริง ให้เยอะ NO.1',
  //   'กระต่ายอ้วน อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟโดนหมาโดนหยิก อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟแมวอินเลิฟ  อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟแมวกินพิซซ่า  อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟแมวงง  อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟแมวอ้าปาก อร่อยจริง ให้เยอะ NO.1',
  //   'กาแฟร้ออนนนนนนนนนนน  อร่อยจริง ให้เยอะ NO.1',
  // ];

  int order_qty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro_name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network('http://${IP}/coffeeshop/${widget.pro_image}', 
            width: 200, 
            height: 300,
            ),

            Text('ราคา ${widget.pro_price} บาท',
              // maxLines: 4,
              // overflow: TextOverflow.ellipsis,
            ),

            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                        child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (order_qty > 1) {
                              order_qty--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ),
                    
                    
                    Text('${order_qty} แก้ว',),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            order_qty++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20, left: 80, right: 80),
              child: Card(
                color: Color.fromARGB(255, 2, 161, 10),
                child: ListTile(
                  onTap: () {
                    
                  },
                  title:  Center(
                    child: Text("ยืนยันคำสั่งซื้อ", style: TextStyle(color: Colors.yellow,),),
                  ),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}