import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/QPPage/CSE3.dart';
import 'package:vtunotes/QPPage/CSE4.dart';
import 'package:vtunotes/QPPage/CSE5.dart';
import 'package:vtunotes/QPPage/CSE6.dart';
import 'package:vtunotes/QPPage/CSE7.dart';

class BCSQP extends StatefulWidget {
  @override
  _BCSQPState createState() => _BCSQPState();
}

class _BCSQPState extends State<BCSQP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                iconTheme: IconThemeData(
                  color: Colors.black),
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://m.jagranjosh.com/imported/images/E/Articles/cds-previous-question-paper.jpg",
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
                    "Computer Science Question Papers",
                    style: GoogleFonts.ubuntu(
                        fontSize: 27, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 28,
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Text(
                    "Select Semester :",
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.blueGrey),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 15, left: 25, right: 25, bottom: 15),
                  height: 49,
                  color: Colors.transparent,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                          context, BouncyPageRoute(widget: CSE3QP()));
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
                          context, BouncyPageRoute(widget: CSE4QP()));
                    },
                    child: Text(
                      "Semester 4",
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
                          context, BouncyPageRoute(widget: CSE5QP()));
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
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                  height: 49,
                  color: Colors.transparent,
                  child: FlatButton(
                    color: Colors.deepPurple,
                    onPressed: () {
                      Navigator.push(
                          context, BouncyPageRoute(widget: CSE6QP()));
                    },
                    child: Text(
                      "Semester 6",
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
                          context, BouncyPageRoute(widget: CSE7QP()));
                    },
                    child: Text(
                      "Semester 7",
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
