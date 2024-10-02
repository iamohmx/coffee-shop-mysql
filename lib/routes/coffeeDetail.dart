import 'package:flutter/material.dart';



class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key, required this.pro_image, required this.pro_name, required this.pro_price, required this.pro_id, required this.username});

  final String pro_image, pro_name, username, pro_id, pro_price;
  final IP = '10.34.5.12';


  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  
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
            Image.network('http://${widget.IP}/coffeeshop/${widget.pro_image}', 
            width: 400, 
            height: 400,
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (order_qty > 1) {
                            order_qty--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    
                    Text('${order_qty} แก้ว'),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          order_qty++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}