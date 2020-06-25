import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/models/postlisttype.dart';
import 'package:vtunotes/widgets/LazyLoadPosts.dart';
import 'package:vtunotes/widgets/PaginatePosts.dart';
import './../config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostListType _type = PostListType.asListile;

  String _view = "lazy";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VTU Notifications",
            style: GoogleFonts.ubuntu(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Color(0xff121212),
            )),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Color(0xff121212),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xff121212)
            : Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed("/search");
            },
          ),
        ],
      ),
      body: _view == "lazy"
          ? PaginatePosts(
      postListType: _type,
    )
          : LazyLoadPosts(
              postListType: _type,
            ),
    );
  }
}
