import 'dart:ui';

import 'package:demo_app/src/animated_todo.dart';
import 'package:demo_app/src/bmi_calculator.dart';
import 'package:demo_app/src/call_history.dart';
import 'package:demo_app/src/whatsapp.dart';
import 'package:demo_app/src/widgets/conversations_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.6),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.5),
        title: Text("Whatsapp"),
        actions: [
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ConversationsList(),
          BmiCalculatorPage(),
          //AnimatedTodo(),
          CallHistory(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _tabController.animateTo(_tabController.index == 0 ? 1 : 0);
        },
        child: Icon(Icons.rice_bowl_rounded),
      ),
    );
  }
}
