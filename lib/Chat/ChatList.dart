import 'package:flutter/material.dart';

class ChatList {
  final String name, lastMessage, image, time, call;
  final bool isactive;
  final IconData iconData;

  ChatList(
      {this.name,
      this.image,
      this.isactive,
      this.lastMessage,
      this.time,
      this.call,
      this.iconData});
}

List chat = [
  ChatList(
    name: 'Ron',
    image: "images/pic1.jpg",
    isactive: true,
    lastMessage: "Hey How are you",
    time: '12:53',
    call: "Yesterday,6:07 pm",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Max',
    image: "images/pic2.jpg",
    isactive: true,
    lastMessage: "We should meet",
    time: '11:20',
    call: "Yesterday,6:07 pm",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Angela',
    image: "images/pic3.jpg",
    isactive: true,
    lastMessage: "Have a nice day Jeffin",
    time: '11:06',
    call: "Yesterday,10:45 am",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Leon',
    image: "images/pic4.jpg",
    isactive: true,
    lastMessage: "On my way",
    time: '10:30',
    call: "26 March,8:29 pm",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Lisy',
    image: "images/pic5.jpg",
    isactive: true,
    lastMessage: "I had a fun time last week",
    time: '9:41',
    call: "25 March, 3:31 pm",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Jerin',
    image: "images/pic6.jpg",
    isactive: true,
    lastMessage: "Could you help me with something",
    time: '8:36',
    call: "25 March,11:02 am",
    iconData: Icons.call,
  ),
  ChatList(
    name: 'Helen',
    image: "images/pic7.jpg",
    isactive: true,
    lastMessage: "Good night Jeffin",
    time: '6:00',
    call: " 24 March,4:29pm",
    iconData: Icons.call,
  ),
];
