import "package:flutter/material.dart";
import "package:project01/routes/coffeePage.dart";

void main(){
  // call statelessWidget
  runApp(Project01());
}

class Project01 extends StatelessWidget {
  const Project01({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // color: Colors.brown,
          backgroundColor: Colors.brown,
          centerTitle: true,
        )
      ),
      home: CoffeeShop(),
    );
  }
}
class CoffeeShop extends StatefulWidget {
  const CoffeeShop({super.key});

  @override
  State<CoffeeShop> createState() => _CoffeeShopState();
}

class _CoffeeShopState extends State<CoffeeShop> {

  bool hidePassword = true;

  var tblogin = ["test","1234"];

  TextEditingController us = TextEditingController();
  TextEditingController pw = TextEditingController();


  void showAlert(BuildContext context, String t, String msg){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(t),
          content: Text(msg),
          actions: [
            Card(
              color: Colors.red,
              child: ListTile(
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                title: Center(
                  child: Text("Okay"),
                ),
              ),
            ),
          ],
        );
      },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.coffee_maker, color: Colors.white,),
        title: Text("Coffee Shop", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: TextField(
                controller: us,
                maxLength: 20,
                decoration: InputDecoration(
                  hintText: "Username(Max 20 Letters): ",
                  suffixIcon: Icon(Icons.person_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  )
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                controller: pw,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  hintText: "Password ",
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  }, icon: 
                    Icon(
                      hidePassword ?
                      Icons.visibility_off :
                      Icons.visibility
                    )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  )
                )
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 30, left: 40, right: 40),
              child: Card(
                color: const Color.fromARGB(255, 14, 121, 209),
                child: ListTile(
                  onTap: (){
                    setState(() {
                      // chk user password
                      if(us.text.isEmpty || pw.text.isEmpty) {
                        showAlert(context, "Username Or Password Is Empty", "Hello Baby Should Enter Your Username And Password!");
                      } else {
                        
                        if(tblogin[0].contains(us.text) && tblogin[1].contains(pw.text)) {
                          // pass
                          Navigator.push(context, 
                            MaterialPageRoute(builder: 
                            (context) => CoffeePage(),
                            )
                          );

                        } else {
                          // cant pass
                          showAlert(context, "Username Or Password Wrong Or Somthing else!", "Hello Baby Check Username Or Password Again!");
                        }
                      }

                    });
                  },
                  title: Center(
                    child: Text("Login", 
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
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
