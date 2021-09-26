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
    return Padding(
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
                  child: Center(child: Text(name)),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      sender,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
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
    );
  }
}
