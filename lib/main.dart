import 'package:demo_app/src/animated_todo.dart';
import 'package:demo_app/src/animations.dart';
import 'package:demo_app/src/home_page.dart';
import 'package:demo_app/src/whatsapp.dart';
import 'package:demo_app/src/whatsapp_ios.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
