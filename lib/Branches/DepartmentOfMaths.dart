import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/sempage/M1.dart';
import 'package:vtunotes/sempage/M2.dart';
import 'package:vtunotes/sempage/M3.dart';
import 'package:vtunotes/sempage/M4.dart';

class Maths extends StatefulWidget {
  @override
  _MathsState createState() => _MathsState();
}

class _MathsState extends State<Maths> {
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
                          "https://undark.org/wp-content/uploads/2020/01/GettyImages-154932300.jpg",
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
                        "Engineering Mathematics",
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
                        "Engineering mathematics is a branch of applied mathematics concerning mathematical methods and techniques that are typically used in engineering and industry. Along with fields like engineering physics and engineering geology, both of which may belong in the wider category engineering science, engineering mathematics is an interdisciplinary subject motivated by engineers' needs both for practical, theoretical and other considerations outwith their specialization, and to deal with constraints to be effective in their work.",
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
                        "Select Option :",
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
                              context, BouncyPageRoute(widget: M1()));
                        },
                        child: Text(
                          "Engineering Maths 1",
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
                              context, BouncyPageRoute(widget: M2()));
                        },
                        child: Text(
                          "Engineering Maths 2",
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
                              context, BouncyPageRoute(widget: M3()));
                        },
                        child: Text(
                          "Engineering Maths 3",
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
                              context, BouncyPageRoute(widget: M4()));
                        },
                        child: Text(
                          "Engineering Maths 4",
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
