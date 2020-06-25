import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/sempage/civil3.dart';
import 'package:vtunotes/sempage/civil4.dart';
import 'package:vtunotes/sempage/civil5.dart';
import 'package:vtunotes/sempage/civil6.dart';
import 'package:vtunotes/sempage/civil7.dart';
import 'package:vtunotes/sempage/civil8.dart';

class CivilNotes extends StatefulWidget {
  @override
  _CivilNotesState createState() => _CivilNotesState();
}

class _CivilNotesState extends State<CivilNotes> {
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
                          "https://cnc.bc.ca/images/default-source/programs/start_building_your_fututre.tmb-1000px.jpg?sfvrsn=56db1683_1",
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
                        "Civil Engineering",
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
                        "One of the oldest and broadest engineering disciplines, Civil Engineering involves planning, designing, constructing, maintaining and supervising infrastructures which include facilities essential to modern life like highways, bridges and tunnels, schools, hospitals, airports and other buildings, sewage systems and water treatment facilities. Subsequently, the course also involves protecting the public and environmental health as well as improving existing infrastructure. According to a new research report by Global Market Insights, Inc, the Civil Engineering Market size is expected to grow up to USD 11.72 trillion by 2025.",
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
                              context, BouncyPageRoute(widget: Civil3()));
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
                              context, BouncyPageRoute(widget: Civil4()));
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
                              context, BouncyPageRoute(widget: Civil5()));
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
                              context, BouncyPageRoute(widget: Civil6()));
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
                              context, BouncyPageRoute(widget: Civil7()));
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
                    Container(
                      margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      height: 49,
                      color: Colors.transparent,
                      child: FlatButton(
                        color: Colors.deepPurple,
                        onPressed: () {
                          Navigator.push(
                              context, BouncyPageRoute(widget: Civil8()));
                        },
                        child: Text(
                          "Semester 8",
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
