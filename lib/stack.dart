import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StackAnimation(),
      ),
    );
  }
}

class StackAnimation extends StatefulWidget {
  @override
  _StackAnimationState createState() => _StackAnimationState();
}

class _StackAnimationState extends State<StackAnimation> {
  bool _isExpanded = false;

  void startAnimation() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          color: Colors.red,
          width: 300,
          height: 300,
          child: AnimatedAlign(
            alignment: _isExpanded ? Alignment.topCenter: Alignment.topLeft,
            duration: const Duration(seconds: 1),
            child:GestureDetector(child: SizedBox(width : 100, height: 100, child: Image.asset('assets/images/parrot.jpg')),onTap: () {
              startAnimation();
            },),
          ),
        ),
      ),
    );

  }
}
