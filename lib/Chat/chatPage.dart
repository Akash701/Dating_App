import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:closer/Chat/Camera.dart';
import 'package:closer/Map/geolocation.dart';
import 'package:closer/Search.dart';
import 'package:closer/Chat/messge.dart';
import 'package:closer/Chat/Profile.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Future _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        Navigator.pop(context);
      }
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Chat();
    }));
  }

  Camera camera = Camera();
  int _selectedicon = 1;
  File imageFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Message(),
      MapPage(),
      Search(),
      SafeArea(
        child: Profile(),
      ),
    ];
    return Scaffold(
      body: tabs[_selectedicon],
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 30),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black54,
        // unselectedItemColor: Colors.white,
        currentIndex: _selectedicon,
        onTap: (index) {
          setState(() {
            _selectedicon = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_rounded,
              ),
              // icon: IconButton(
              //   onPressed: () {
              //     _openCamera(context);
              //   },
              //
              // ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: Hero(
                tag: 'akash',
                child: CircleAvatar(
                  backgroundImage: imageFile == null
                      ? AssetImage('images/pic1.jpg')
                      : FileImage(File(imageFile.path)),
                  radius: 14,
                ),
              ),
              label: ""),
        ],
      ),
    );
  }
}
