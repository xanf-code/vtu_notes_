import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/sempage/EEE3.dart';
import 'package:vtunotes/sempage/EEE5.dart';
import 'package:vtunotes/sempage/Mech3.dart';
import 'package:vtunotes/sempage/Mech5.dart';

class MECHNotes extends StatefulWidget {
  @override
  _MECHNotesState createState() => _MECHNotesState();
}

class _MECHNotesState extends State<MECHNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://peachyessay.com/wp-content/uploads/2020/04/Mechanical-Engineering-Assignment-Help-e1587640734445.jpg",
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: EdgeInsets.only(top: 24, left: 25),
                      child: Text(
                        "Mechanical Engineering",
                        style: GoogleFonts.ubuntu(
                            fontSize: 27,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      height: 28,
                      margin: EdgeInsets.only(top: 23),
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Description",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                      child: Text(
                        "One of the most diverse and versatile engineering fields, mechanical engineering is the study of objects and systems in motion. As such, the field of mechanical engineering touches virtually every aspect of modern life, including the human body, a highly complex machine.",
                        style: GoogleFonts.ubuntu(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            height: 2,
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      height: 28,
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        "Select Semester :",
                        style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      height: 49,
                      color: Colors.transparent,
                      child: FlatButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.push(
                              context, BouncyPageRoute(widget: MECH3()));
                        },
                        child: Text(
                          "Semester 3",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      height: 49,
                      color: Colors.transparent,
                      child: FlatButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.push(
                              context, BouncyPageRoute(widget: MECH5()));
                        },
                        child: Text(
                          "Semester 5",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
