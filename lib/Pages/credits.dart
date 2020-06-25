//import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

//class Credits extends StatefulWidget {
//  @override
//  _CreditsState createState() => _CreditsState();
//}
//
//class _CreditsState extends State<Credits> {
//  PageController pageController;
//
//  final List<String> images = [
//    'assets/images/1.png',
//    'assets/images/2.png',
//    'assets/images/3.gif',
//    'assets/images/4.png',
//  ];
//
//  @override
//  void initState() {
//    super.initState();
//    pageController = PageController(initialPage: 1, viewportFraction: 0.9);
//  }
//
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.white : Color(0xff121212),
//        body: Column(
//          children: <Widget>[
//            Container(
//              height: 150,
//              width: double.infinity,
//              //color: Colors.blue,
//            ),
//            Center(
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    'CREDITS',
//                    style: GoogleFonts.ubuntu(
//                      fontSize: 50,
//                      fontWeight: FontWeight.bold,
//                      color: Theme.of(context).brightness == Brightness.light ? Color(0xff121212) : Colors.white,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Expanded(
//              child: Container(
//                color: Theme.of(context).brightness == Brightness.light ? Colors.white : Color(0xff121212),
//                child: PageView.builder(
//                  physics: BouncingScrollPhysics(),
//                    controller: pageController,
//                    itemCount: images.length,
//                    itemBuilder: (context, position) {
//                      return imageSlider(position);
//                    }),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  imageSlider(int index) {
//    return AnimatedBuilder(
//      animation: pageController,
//      builder: (context, widget) {
//        double value = 1;
//        if (pageController.position.haveDimensions) {
//          value = pageController.page - index;
//          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//        }
//
//        return Center(
//          child: SizedBox(
//            height: Curves.easeInOut.transform(value) * 450,
//            width: Curves.easeInOut.transform(value) * 300,
//            child: widget,
//          ),
//        );
//      },
//      child: Container(
//        //color: Colors.lightBlue,
//        child: Image.asset(images[index]),
//      ),
//    );
//  }
//}
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}


class _CreditsState extends State<Credits> {
  int page = 0;

  final pages = [
    Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl:
                "https://cdn.dribbble.com/users/1518535/screenshots/7528356/media/e11e5b8aaa2187e4e1a7c3da0553208e.gif",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Hi",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Text(
                "It's Me",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesome5Brands.behance),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: ()=> launch("https://www.behance.net/gallery/95314405/Sports-Top"),
                    child: Text(
                      "Behance",
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(FontAwesome5Brands.twitter),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: ()=> launch("https://twitter.com/iamlardBendtner"),
                    child: Text(
                      "Twitter",
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Color(0xffff8171),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(imageUrl: "https://cdn.dribbble.com/users/2021758/screenshots/7000982/media/a87ca7e086c9d33d0d2bcdc51e3baed8.gif",fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "UI Design Inspiration",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Iryna Korshak",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              InkWell(
                onTap: () => launch("https://dribbble.com/irynakorshak"),
                child: Text(
                  "@WastingMyTime",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Color(0xfffed423),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(imageUrl: "https://miro.medium.com/max/1600/1*CY9TDTkZ6tTcApIbsLSJ0w.gif",fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Icons",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Logo",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Assets",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              InkWell(
                onTap: ()=> launch("https://twitter.com/mcookie"),
                child: Text(
                  "Michael Cook",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple),
                ),
              ),
              InkWell(
                onTap: ()=> launch("https://www.humaaans.com/"),
                child: Text(
                  "humaaans",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Color(0xff0e7f6c),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(imageUrl: "https://cdn.dribbble.com/users/2726/screenshots/12125186/media/f610c5268fc1cfcc142ea0c5f981e08f.gif",fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Backend Data",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              InkWell(
                onTap: ()=> launch("https://www.diginotes.in/"),
                child: Text(
                  "Digi Notes",
                  style: GoogleFonts.ubuntu(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.yellowAccent),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      color: Color(0xff123f70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CachedNetworkImage(imageUrl: "https://cdn.dribbble.com/users/2142170/screenshots/4737356/icons_social_media_dribbble.gif",fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: <Widget>[
              Text(
                "Do",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Share the app",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                "Thank You",
                style: GoogleFonts.ubuntu(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    ),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              fullTransitionValue: 200,
              enableSlideIcon: true,
              enableLoop: true,
              positionSlideIcon: 0.5,
              onPageChangeCallback: pageChangeCallback,
              currentUpdateTypeCallback: updateTypeCallback,
              waveType: WaveType.liquidReveal,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(5, _buildDot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    print(lpage);
    setState(() {
      page = lpage;
    });
  }

  updateTypeCallback(UpdateType updateType) {
    print(updateType);
  }
}
