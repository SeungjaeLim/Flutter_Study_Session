import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int dice1 = 1;
  int dice2 = 1;
  int sum = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Row(children: [
                  Expanded(child: Image.asset('assets/images/dice$dice1.png')),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Expanded(child: Image.asset('assets/images/dice$dice2.png'))
                ]),
              ),
              Text(
                "$sum",
                style: const TextStyle(color: Colors.white, fontSize: 52),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              dice1 = Random().nextInt(6) + 1;
              dice2 = Random().nextInt(6) + 1;
              sum = dice1 + dice2;
              print("pushed this button");
            });
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
