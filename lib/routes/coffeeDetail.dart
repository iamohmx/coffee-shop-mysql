import 'package:flutter/material.dart';



class CoffeeDetail extends StatefulWidget {
  const CoffeeDetail({super.key, required this.img, required this.cname, required this.cost, required this.id,});

  final String img, cname;
  final int cost, id;



  @override
  State<CoffeeDetail> createState() => _CoffeeDetailState();
}

class _CoffeeDetailState extends State<CoffeeDetail> {
  
  var detail = [
    'มอคค่า อร่อยจริง ให้เยอะ NO.1',
    'กาแฟดอกไม้ อร่อยจริง ให้เยอะ NO.1',
    'กาแฟแมวยิ้ม อร่อยจริง ให้เยอะ NO.1',
    'กระต่ายอ้วน อร่อยจริง ให้เยอะ NO.1',
    'กาแฟโดนหมาโดนหยิก อร่อยจริง ให้เยอะ NO.1',
    'กาแฟแมวอินเลิฟ  อร่อยจริง ให้เยอะ NO.1',
    'กาแฟแมวกินพิซซ่า  อร่อยจริง ให้เยอะ NO.1',
    'กาแฟแมวงง  อร่อยจริง ให้เยอะ NO.1',
    'กาแฟแมวอ้าปาก อร่อยจริง ให้เยอะ NO.1',
    'กาแฟร้ออนนนนนนนนนนน  อร่อยจริง ให้เยอะ NO.1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cname}"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(widget.img, 
            width: 400, 
            height: 400,
            ),

            Text('${detail[widget.id]}',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),

            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('${widget.cost} Baht', 
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                fontSize: 20
                )
               ),
            ),
            
            // ListTile(
            //   title: Text("${widget.cname}"),
            //   // subtitle: Text(widget.cost.toString()+" BATH"),
            //   subtitle: Text("${widget.cost} BATH"),
            // ),
          ],
        ),
      ),
    );
  }
}