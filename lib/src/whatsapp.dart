import 'dart:ui';

import 'package:flutter/material.dart';

class WhatsappPage extends StatefulWidget {
  const WhatsappPage({Key? key}) : super(key: key);

  @override
  _WhatsappPageState createState() => _WhatsappPageState();
}

class _WhatsappPageState extends State<WhatsappPage> {
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
      ),
      body: ListView(
        children: [
          for (var i = 0; i < 7; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Allan T.",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "And ui will fit her needs",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "8:13 PM",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 2,
                    color: Colors.white,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
