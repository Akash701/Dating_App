import 'package:closer/Chat/chatPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File imageFile;
  final picker = ImagePicker();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _openCamera(context);
        },
      ),
    );
  }
}
