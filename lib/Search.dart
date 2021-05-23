import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF030047),
        title: Center(
          child: Text('Search Users'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Items(
            Icon(
              Icons.music_note_outlined,
              size: 30,
              color: Colors.white,
            ),
            "Music",
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
          Items(
              Icon(
                Icons.camera_roll_rounded,
                size: 30,
                color: Colors.white,
              ),
              "Movie"),
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
          Items(
            Icon(
              Icons.book_rounded,
              size: 30,
              color: Colors.white,
            ),
            "Books & Reading",
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
          Items(
            Icon(
              Icons.fastfood_rounded,
              size: 30,
              color: Colors.white,
            ),
            "Food",
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
          Items(
              Icon(
                Icons.flight,
                size: 30,
                color: Colors.white,
              ),
              "Travel"),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Search',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items(this.icon, this.data);
  final Icon icon;
  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFF030047),
                ),
                width: 60,
                height: 60,
                child: icon,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white60,
                      )),
                  child: Icon(Icons.check, color: Colors.white, size: 13),
                ),
              ),
            ],
          ),
          Text(
            data,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
