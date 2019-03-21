import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Container(
            width: 20,
            height: 20,
            constraints: BoxConstraints.loose(Size(20, 20)),
            child: Image.asset(
              "assets/ic_launcher.png",
              fit: BoxFit.none,
            ),
          ),
        ),
      ),
    );
  }
}
