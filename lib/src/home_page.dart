import 'dart:ui';

import 'package:demo_app/src/animated_todo.dart';
import 'package:demo_app/src/whatsapp.dart';
import 'package:demo_app/src/widgets/conversations_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            tabs: [
              Tab(
                text: "Chats",
              ),
              Tab(
                text: "Status",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ConversationsList(),
            AnimatedTodo(),
          ],
        ),
      ),
    );
  }
}
