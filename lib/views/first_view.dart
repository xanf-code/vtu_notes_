import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/animation/bouncy.dart';

class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(0, 10, 153, 1.0),
                Color.fromRGBO(245, 50, 111, 1.0),
              ]),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: _height * 0.07),
                    Container(
                      child: SizedBox(
                        child: SvgPicture.asset("assets/login.svg"),
                      ),
                    ),
                    SizedBox(height: _height * 0.03),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 500),
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "VTU",
                                style: GoogleFonts.ubuntu(
                                    color: Colors.grey, fontSize: 40),
                              ),
                              TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: "NOTES",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.orange, fontSize: 40),
                                    ),
                                  ]),
                            ]),
                      ),
                    ),
                    SizedBox(height: _height * 0.03),
                    DelayedDisplay(
                      delay: Duration(milliseconds: 500),
                      child: AutoSizeText(
                        "Welcome to your VTU Companion",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ubuntu(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: _height * 0.03),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/signIn');
                            },
                            child: DelayedDisplay(
                              delay: Duration(milliseconds: 500),
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 23,
                                      spreadRadius: -13,
                                    )
                                  ],),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.signInAlt,
                                        color: Colors.deepPurple, size: 30.0),
                                    Text(
                                      "   | Sign in with Email",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black, fontSize: 20,fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: _height * 0.025),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/signUp');
                            },
                            child: DelayedDisplay(
                              delay: Duration(milliseconds: 500),
                              child: Container(
                                padding:
                                    EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 15),
                                      blurRadius: 23,
                                      spreadRadius: -13,
                                    )
                                  ],),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.userAlt,
                                        color: Colors.deepPurple, size: 30.0),
                                    Text(
                                      "   | Sign up with Email",
                                      style: GoogleFonts.ubuntu(
                                          color: Colors.black, fontSize: 20,fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
