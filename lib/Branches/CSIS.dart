import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/sempage/cse3.dart';
import 'package:vtunotes/sempage/cse4.dart';
import 'package:vtunotes/sempage/cse5.dart';
import 'package:vtunotes/sempage/cse6.dart';
import 'package:vtunotes/sempage/cse7.dart';

class ComputerScience extends StatefulWidget {
  @override
  _ComputerScienceState createState() => _ComputerScienceState();
}

class _ComputerScienceState extends State<ComputerScience> {
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
                              "https://wp-media.petersons.com/blog/wp-content/uploads/2017/12/10124351/luca-bravo-217276-unsplash.jpg",
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
                    "Computer Science",
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
                    "Computer Science is the study of how data and instructions are processed, stored, communicated by computing devices. A modern descendant of Applied Mathematics and Electrical Engineering, Computer Science deals with algorithms for processing data, the symbolic representation of data and instructions, the design of instruction languages for processing data, techniques for writing software that process data on a variety of computing platforms, protocols for communicating data reliably and securely across networks, the organization of data in databases of various types and scales, the emulation of human intelligence and learning through computer algorithms, statistical modeling of data in large databases to support inference of trends, and techniques for protecting the content and authenticity of data. Therefore, computer scientists are scientists and mathematicians who develop ways to process, interpret, store, communicate, and secure data.",
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
                          context, BouncyPageRoute(widget: CSE3()));
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
                          context, BouncyPageRoute(widget: CSE4()));
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
                          context, BouncyPageRoute(widget: CSE5()));
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
                          context, BouncyPageRoute(widget: CSE6()));
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
                          context, BouncyPageRoute(widget: CSE7()));
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
