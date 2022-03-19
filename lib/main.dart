// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_print, unused_local_variable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future register() async {
    var url = Uri.parse('http://192.168.1.124/loginphp/register.php');
    var response = await http.post(url, body: {
      "firstname": firstname.text,
      "lastname": lastname.text,
      "username": username.text,
      "pass": password.text,
    });
    var data = json.decode(response.body);
    print(data);
    if(data == 'error'){
      Fluttertoast.showToast(
        msg: "ERROR !!!!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }else{
      Fluttertoast.showToast(
        msg: "Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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
            Text("Firstname"),
            TextFormField(
              controller: firstname,
            ),
            Text("Lastname"),
            TextFormField(
              controller: lastname,
            ),
            Text("Username"),
            TextFormField(
              controller: username,
            ),
            Text("Password"),
            TextFormField(
              obscureText: true,
              controller: password,
            ),
            ElevatedButton(
                onPressed: () {
                  // print(firstname.text);
                  // print(lastname.text);
                  // print(username.text);
                  // print(password.text);
                  register();
                },
                child: Text('insert'))
          ],
        ),
      )),
    );
  }
}
