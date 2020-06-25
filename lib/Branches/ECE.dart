import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/sempage/civil3.dart';
import 'package:vtunotes/sempage/civil4.dart';
import 'package:vtunotes/sempage/civil5.dart';
import 'package:vtunotes/sempage/civil6.dart';
import 'package:vtunotes/sempage/ece3.dart';
import 'package:vtunotes/sempage/ece4.dart';
import 'package:vtunotes/sempage/ece5.dart';
import 'package:vtunotes/sempage/ece6.dart';

class ECENotes extends StatefulWidget {
  @override
  _ECENotesState createState() => _ECENotesState();
}

class _ECENotesState extends State<ECENotes> {
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
                          "https://www.directics.com/wp-content/uploads/2017/05/microprocessor-1-1.jpg",
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
                        "Electronics and Communication Engineering",
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
                        "Electronics & Communication Engineering deals with the electronic devices, circuits, communication equipments like transmitter, receiver, integrated circuits (IC). It also deals with basic electronics, analog and digital transmission & reception of data, voice and video (Example AM, FM, DTH), microprocessors, satellite communication, microwave engineering, antennae and wave progression. It aims to deepen the knowledge and skills of the students on the basic concepts and theories that will equip them in their professional work involving analysis, systems implementation, operation, production, and maintenance of the various applications in the field of Electronics and Communications Engineering.",
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
                              context, BouncyPageRoute(widget: ECE3()));
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
                              context, BouncyPageRoute(widget: ECE4()));
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
                              context, BouncyPageRoute(widget: ECE5()));
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
                              context, BouncyPageRoute(widget: ECE6()));
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
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
