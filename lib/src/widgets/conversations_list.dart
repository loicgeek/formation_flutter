import 'package:demo_app/src/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class ConversationsList extends StatefulWidget {
  const ConversationsList({Key? key}) : super(key: key);

  @override
  _ConversationsListState createState() => _ConversationsListState();
}

void onConversationItemTapped(int i) {
  print("Conversation tapped at :$i");
}

void onConversationItemLongPressed(int i) {
  print("Conversation long pressed at :$i");
}

class _ConversationsListState extends State<ConversationsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < 7; i++)
          GestureDetector(
            onTap: () {
              onConversationItemTapped(i);
            },
            onLongPress: () {
              print("Conversation long pressed at :$i");
            },
            child: ConversationItem(
              date: "15-04-2021",
              name: "LN",
              sender: "Sender ${i + 1}",
              message: "Text message ${i + 1}",
            ),
          ),
      ],
    );
  }
}
