import "package:flutter/material.dart";
import 'package:project01/admin.dart';
import "package:project01/routes/coffeePage.dart";
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  // call statelessWidget
  runApp(const Project01());
}

class Project01 extends StatelessWidget {
  const Project01({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        // color: Colors.brown,
        backgroundColor: Colors.brown,
        centerTitle: true,
      )),
      home: const CoffeeShop(),
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

  // var tblogin = ["test","1234"];
  
  TextEditingController us = TextEditingController();
  TextEditingController pw = TextEditingController();
  
  var resultLogin = '', login = '', st = '';

  final IP = '10.34.5.12';

  void checkLogin(String username, String password, String user_id) async {
    try {
      String url = "http://${IP}/coffeeshop/login.php?us=$username&pw=$password";

      print(url);
      var response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json;charset=UTF-8',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });
      if (response.statusCode == 200) {
        var rs = response.body.replaceAll('ï»¿', '');
        var rsLogin = convert.jsonDecode(rs);

        setState(() {
          login = rsLogin['login'];
          if (login.contains('OK')) {

            st = rsLogin['status'];

            if(st.contains('user')) {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoffeePage(username: us.text, user_id: rsLogin['user_id']),
                )
              );

            } else {
              // admin page....
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminPage(),
              ));
            }
            // resultLogin = 'Login ถูกต้อง';
          } else {
            // resultLogin = 'Login ผิดพลาด';
            showAlert(
              context,
              "Username Or Password Wrong Or Somthing else!",
              "Hello Baby Check Username Or Password Again!"
            );
          }
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      print(e);
    }
  }


  void showAlert(BuildContext context, String t, String msg) {
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
                title: const Center(
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
        leading: const Icon(
          Icons.coffee_maker,
          color: Colors.white,
        ),
        title: const Text(
          "Coffee Shop",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
              child: TextField(
                  controller: us,
                  maxLength: 20,
                  decoration: InputDecoration(
                      hintText: "Username(Max 20 Letters): ",
                      suffixIcon: const Icon(Icons.person_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black)))),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                  controller: pw,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                      hintText: "Password ",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black)))),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
              child: Card(
                color: const Color.fromARGB(255, 14, 121, 209),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      // chk user password
                      if (us.text.isEmpty || pw.text.isEmpty) {
                        showAlert(context, "Username Or Password Is Empty",
                            "Hello Baby Should Enter Your Username And Password!");
                      } else {
                        checkLogin(us.text, pw.text, '');
                      }
                    });
                  },
                  title: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
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
