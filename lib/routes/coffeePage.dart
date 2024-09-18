import 'package:flutter/material.dart';
import 'package:project01/routes/coffeeDetail.dart';


class CoffeePage extends StatefulWidget {
  const CoffeePage({super.key});

  @override
  State<CoffeePage> createState() => _CoffeePageState();
}

class _CoffeePageState extends State<CoffeePage> {

  var coffeePrice = [
    100,120,255,95,65,
    150,250,120,150,50,
  ];

  var coffeeImages = [
    "coffeeimages/00.png",
    "coffeeimages/11.jpg",
    "coffeeimages/22.jpg",
    "coffeeimages/33.jpg",
    "coffeeimages/44.jpg",
    "coffeeimages/55.jpg",
    "coffeeimages/66.jpg",
    "coffeeimages/77.jpg",
    "coffeeimages/88.jpg",
    "coffeeimages/99.png",    
  ];

  var coffeeName = [
    'กาแฟมอคค่า',
    'กาแฟดอกไม้',
    'กาแฟแมวยิ้ม',
    'กาแฟกระต่ายอ้วน',
    'กาแฟหมาโดนหยิก',
    'กาแฟแมวอินเลิฟ',
    'กาแฟแมวกินพิซซ่า',
    'กาแฟแมวงง',
    'กาแฟแมวอ้าปาก',
    'กาแฟร้อน',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coffee Menu"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: coffeeImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2)),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => 
                      CoffeeDetail(
                        img: coffeeImages[index], 
                        cname: coffeeName[index], 
                        cost: coffeePrice[index],
                        id: index,
                        ),
                      )
                  );
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      coffeeImages[index],
                      height: 60,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        coffeeName[index],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}