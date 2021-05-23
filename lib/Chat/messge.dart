import 'package:flutter/material.dart';
import 'package:closer/Chat/ChatList.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chat.length,
              itemBuilder: (context, int index) => InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return;
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(chat[index].image),
                            radius: 30,
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white60,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                chat[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Opacity(
                                opacity: 0.64,
                                child: Text(
                                  chat[index].lastMessage,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        child: Text(chat[index].time),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
