import 'package:ani_controller/stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StackAnimation(),
    );
  }
}
class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page>with TickerProviderStateMixin {

  late Animation<double> fadeAnimation;
  late AnimationController fadeAnimationController;
  @override
  void initState() {
    super.initState();
    fadeAnimationController =AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2),
    );
    fadeAnimation = Tween(
        begin: 0.0,
        end: 1.0,
    ).animate(fadeAnimationController.view);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Animation Controller",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: fadeAnimation,
                child: Center(
                  child:
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.pink,
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                fadeAnimationController.forward();
              }, child: Text('Show')),
              ElevatedButton(onPressed: () {
                fadeAnimationController.reverse();
              }, child: Text('Hide')),
            ],
          ),
      ),
    );
  }
}

