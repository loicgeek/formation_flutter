import 'package:demo_app/src/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class WhatsappIos extends StatefulWidget {
  const WhatsappIos({Key? key}) : super(key: key);

  @override
  _WhatsappIosState createState() => _WhatsappIosState();
}

class _WhatsappIosState extends State<WhatsappIos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverPadding(
              padding: const EdgeInsets.only(top: 56.0, left: 10, right: 10),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Modifier"),
                    Icon(Icons.edit),
                  ],
                )
              ])),
            ),
            SliverAppBar(
              expandedHeight: 100,
              centerTitle: false,
              // floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Discussions"),
                    ),
                  ],
                ),
                centerTitle: false,
                background: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              for (var i = 0; i < 6; i++)
                ConversationItem(
                  date: "15-04-2021",
                  name: "LN",
                  sender: "Sender ${i + 1}",
                  message: "Text message ${i + 1}",
                ),
            ],
          ),
        ),
      ),
    );
  }
}
