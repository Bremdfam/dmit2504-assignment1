// ignore_for_file: use_key_in_widget_constructors, todo
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //first level widget of Material Design
      home: Scaffold(
        //default route
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text("App1 - UI Layout"),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(
                      color: Colors.black, 
                      width: 4.0
                      )
                  ),
                child: const Center(
                  child: Text("Container 1"),
                ),
              ),
              Transform.rotate(
                angle: 3 / 4,
                child: Container(
                  height: 100.00,
                  width: 100.00,
                  decoration: const BoxDecoration(
                    color: Colors.white
                    ),
                  child: const Center(
                    child: Text("Container 2"),
                  ),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: const BoxDecoration(
                      color: Colors.yellow
                      ),
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Container 3"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue
                      ),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text("Container 4"),
                    ),
                  ),
                ),
              ),
            ]),
            Column(children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, 
                      width: 3.0
                      ),
                    ),
                  child: const Center(
                    child: Text(
                      "Container 5",
                      style: TextStyle(
                        color: Colors.white
                        ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.red
                    ),
                  child: const Text(
                    "Con 6",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}