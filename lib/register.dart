// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
    print(data.toString());
    if (data == 'succes') {
      Fluttertoast.showToast(
          msg: "Succes !!!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
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
                child: Text('Register')),
         
          ],
        ),
      )),
    );
  }
}