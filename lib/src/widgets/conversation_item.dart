import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({
    Key? key,
    required this.sender,
    required this.message,
    required this.name,
    required this.date,
  }) : super(key: key);

  final String sender;
  final String message;
  final String name;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Center(child: Text("${name}")),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(sender),
                          Text(message),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$date",
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "10:00PM",
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
