// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, unused_local_variable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loginphpapp1/register.dart';
import 'package:loginphpapp1/show_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String url = '';
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = Uri.parse('http://192.168.1.124/loginphp/login.php');
    var response = await http.post(url, body: {
      "username": username.text,
      "pass": password.text,
    });
    var data = json.decode(response.body);
    print(data);
    if (data == 'no') {
      Fluttertoast.showToast(
          msg: "User or Password Miss",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Login Success",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) {
            return ShowScreen();
          }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Username"),
            TextFormField(
              controller: username,
            ),
            Text("Password"),
            TextFormField(
              obscureText: true,
              controller: password,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print(username.text);
                      print(password.text);
                      login();
                    },
                    child: Text('login')),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Register();
                      }));
                    },
                    child: Text('Register'))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
