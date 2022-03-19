// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ShowScreen extends StatefulWidget {
  ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('hello'),
            ),
            Center(
                child: ElevatedButton(
              child: Text("back login"),
              onPressed: () {
                Navigator.pop(context);
              },
            ))
          ],
        ),
      ),
    );
  }
}
