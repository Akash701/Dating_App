import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:closer/Search.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File imageFile;
  final picker = ImagePicker();
  // List<File> images = List<File>();

  _openGallery(BuildContext context) async {
    // images.add(
    //   await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 20),
    // );
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.pop(context);
  }

  _openCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    this.setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Profile Photo'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Row(
                    children: [
                      Icon(Icons.image_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Text('Gallery'),
                        onTap: () {
                          _openGallery(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Text('Camera'),
                        onTap: () {
                          _openCamera(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget profilePic(double size) {
      return CircleAvatar(
        backgroundImage: imageFile == null
            ? AssetImage('')
            : FileImage(File(imageFile.path)),
        radius: size,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('My Profile'),
        ),
        backgroundColor: Color(0XFF030047),
        leading: Icon(Icons.person_add_alt_1_rounded),
        actions: [
          Center(
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    child: profilePic(70),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        )),
                    margin: EdgeInsets.only(top: 90, left: 100),
                    child: IconButton(
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Jeffin Mathew',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Opacity(
              opacity: 0.64,
              child: Text(
                'Software Engineer',
                style: TextStyle(),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 20,
            ),
            Items(
              Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
              "About Me",
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Items(
              Icon(
                Icons.videogame_asset_rounded,
                size: 30,
                color: Colors.white,
              ),
              "My interests",
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Items(
              Icon(
                Icons.account_box_rounded,
                size: 30,
                color: Colors.white,
              ),
              "Social Media Link",
            ),
            Divider(
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
