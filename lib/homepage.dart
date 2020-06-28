import 'package:awsome_video_player/awsome_video_player.dart';
import 'package:backdrop/backdrop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtunotes/About2/About2.dart';
import 'package:vtunotes/Branches/Civil.dart';
import 'package:vtunotes/Branches/ECE.dart';
import 'package:vtunotes/Branches/EEE.dart';
import 'package:vtunotes/Branches/Mech.dart';
import 'package:vtunotes/Marking/marking.dart';
import 'package:vtunotes/Placements/MindTree.dart';
import 'package:vtunotes/Placements/TCS.dart';
import 'package:vtunotes/Placements/TechMahindra.dart';
import 'package:vtunotes/Placements/accenture.dart';
import 'package:vtunotes/Placements/infosys.dart';
import 'package:vtunotes/Placements/wipro.dart';
import 'package:vtunotes/QPBranch/CS.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:vtunotes/Branches/CCycle.dart';
import 'package:vtunotes/Branches/CSIS.dart';
import 'package:vtunotes/Branches/DepartmentOfMaths.dart';
import 'package:vtunotes/Branches/PCycle.dart';
import 'package:vtunotes/Pages/FAQs.dart';
import 'package:vtunotes/QPBranch/Civil.dart';
import 'package:vtunotes/QPBranch/ECE.dart';
import 'package:vtunotes/QPBranch/MECH.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/models/CarouselModel.dart';
import 'package:vtunotes/push_notification/pushnotif.dart';
import 'package:vtunotes/screens/home.dart';
import 'package:vtunotes/sempage/M4.dart';
import 'package:vtunotes/sempage/civil3.dart';
import 'package:vtunotes/sempage/cse3.dart';
import 'package:vtunotes/sempage/cse6.dart';
import 'package:vtunotes/syllabus/syl.dart';
import 'package:vtunotes/todo/todomain.dart';
import 'package:vtunotes/widgets/provider_widget.dart';
import 'package:wiredash/wiredash.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vtunotes/admob_services/admob_service.dart';
import 'package:firebase_admob/firebase_admob.dart';

//final List<String> imgList = [
//  "https://i.ytimg.com/vi/3BVQ9Scdglg/maxresdefault.jpg",
//  "https://i.ytimg.com/vi/EMBFnHbl1as/maxresdefault.jpg",
//  "https://www.redcross.org/content/dam/redcross/about-us/news/2020/positivity2tw.jpg.transform/1288/q70/feature/image.jpeg",
//  "https://www.un.org/sustainabledevelopment/wp-content/uploads/2020/03/SG-quote.jpeg",
//];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final ams = AdMobService();

//  int _current = 0;
//  List<T> map<T>(List list, Function handler) {
//    List<T> result = [];
//    for (var i = 0; i < list.length; i++) {
//      result.add(handler(i, list[i]));
//    }
//    return result;
//  }

//  FSBStatus drawerStatus;

  startFirebase() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'notification';
    final value = prefs.getInt(key) ?? 0;
    if (value == 1) {
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  message["notification"]["title"],
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
                content: Text(message["notification"]["body"]),
                actions: <Widget>[
                  FlatButton(
                    child: new Text("Dismiss"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        onLaunch: (Map<String, dynamic> message) async {
          // print("onLaunch: $message");
        },
        onResume: (Map<String, dynamic> message) async {
          // print("onResume: $message");
        },
      );
      _firebaseMessaging.getToken().then((token) {
        // print("Firebase Token:" + token);
      });
    }
  }

  bool _isFullscreen = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InterstitialAd newTapAd = ams.getNewTapInterstitial();
    newTapAd.load();
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: Colors.black,
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Color(0xff121212)
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return Provider(
          child: MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: BackdropScaffold(
              frontLayerBorderRadius: BorderRadius.circular(0.0),
              appBar: !_isFullscreen
                  ? AppBar(
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                      iconTheme: IconThemeData(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black38,
                      ),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Color(0xff121212)
                              : Colors.white,
                      elevation: 0,
//          leading: IconButton(
//              icon: SvgPicture.asset(
//                "assets/menu.svg",
//                color: Theme.of(context).brightness == Brightness.light
//                    ? Colors.black54
//                    : Colors.white54,
//              ),
//              onPressed: () {
//                setState(() {
//                  drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
//                      ? FSBStatus.FSB_CLOSE
//                      : FSBStatus.FSB_OPEN;
//                });
//              }),
//        leading: IconButton(
//            color: Theme.of(context).brightness == Brightness.dark
//                ? Colors.white
//                : Color(0xff121212),
//            icon: Icon(Theme.of(context).brightness == Brightness.light
//                ? Ionicons.md_moon
//                : Ionicons.ios_sunny),
//            onPressed: () {
//              DynamicTheme.of(context).setBrightness(
//                  Theme.of(context).brightness == Brightness.light
//                      ? Brightness.dark
//                      : Brightness.light);
//            }),
                      leading: DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: BackdropToggleButton(
                          icon: AnimatedIcons.close_menu,
                        ),
                      ),
                      actions: <Widget>[
                        DelayedDisplay(
                          delay: Duration(milliseconds: 500),
                          child: IconButton(
                              icon: Icon(Icons.notifications_none),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                newTapAd.show();
                                Navigator.push(context,
                                    BouncyPageRoute(widget: NotifPush()));
                              }),
                        ),
                      ],
                      title: DelayedDisplay(
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
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "NOTES",
                                    style: TextStyle(color: Colors.orange),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : null,
              backLayerBackgroundColor:
                  Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Color(0xff121212),
              backLayer: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
//////                    CachedNetworkImage(
//////                        imageUrl:
//////                            "https://cdn.dribbble.com/users/2844289/screenshots/7599355/media/3bcaeb929b0d8fb0b1cc256637cc0a9c.gif",
//////                        imageBuilder: (context, imageProvider) => Container(
//////                              height: 100,
//////                              width: 100,
//////                              margin: EdgeInsets.only(top: 30, bottom: 20),
//////                              decoration: BoxDecoration(
//////                                shape: BoxShape.circle,
//////                                image: DecorationImage(
//////                                  image: imageProvider,
//////                                  fit: BoxFit.cover,
//////                                ),
//////                              ),
//////                            )),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "Hey, ${snapshot.data.displayName}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 17, fontWeight: FontWeight.w500),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 10,
//////                    ),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "${snapshot.data.email}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 15, fontWeight: FontWeight.w400),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 10,
//////                    ),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "Created: ${DateFormat('MM/dd/yyyy').format(snapshot.data.metadata.creationTime)}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 15, fontWeight: FontWeight.w400),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 30,
//////                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ListTile(
                      leading: Icon(
                        const IconData(0xe907, fontFamily: "vtuicons"),
                        size: 18,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text('Notifications',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: HomeScreen()));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        const IconData(0xe900, fontFamily: "vtuicons"),
                        size: 18,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text('Syllabus',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: sylPage()));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        const IconData(0xe906, fontFamily: "vtuicons"),
                        size: 18,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text('Marking Scheme',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: MarkingPage()));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ExpansionTile(
                      leading: Icon(
                        Entypo.news,
                        size: 18,
                      ),
                      title: Text('Circulars',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      trailing: Icon(
                        Ionicons.ios_arrow_down,
                        size: 12,
                      ),
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Ionicons.ios_paper,
                            size: 18,
                          ),
                          title: Text('Examination',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              textAlign: TextAlign.center),
                          onTap: () {
                            launch(
                                "https://vtu.ac.in/en/category/exam-circulars-notifications/");
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Ionicons.ios_paper,
                            size: 18,
                          ),
                          title: Text('Administration',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                              textAlign: TextAlign.center),
                          onTap: () {
                            launch(
                                "https://vtu.ac.in/en/category/administration-circulars/");
                          },
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        const IconData(0xe905, fontFamily: "vtuicons"),
                        size: 18,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text('Results',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        launch("https://results.vtu.ac.in/");
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.questionCircle,
                        size: 18,
                      ),
                      title: Text('FAQs',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: FAQPage()));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        const IconData(0xe904, fontFamily: "vtuicons"),
                        size: 18,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text('Feedback',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Wiredash.of(context).show();
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0),
                    child: ListTile(
                      leading: Icon(
                        Octicons.settings,
                        size: 18,
                      ),
                      title: Text('Settings',
                          style: GoogleFonts.ubuntu(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context, BouncyPageRoute(widget: About2()));
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, bottom: 12),
                    child: Align(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.trending_up),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Most Viewed : ",
                          style: GoogleFonts.ubuntu(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        newTapAd.show();
                        Navigator.push(
                            context, BouncyPageRoute(widget: CSE6()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white12
                              : Colors.black12.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Color(0xFFE8E8F3),
                              width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "CSE/ISE Semester 6",
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        newTapAd.show();
                        Navigator.push(context, BouncyPageRoute(widget: M4()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white12
                              : Colors.black12.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Color(0xFFE8E8F3),
                              width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "Engineering Maths 4",
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        newTapAd.show();
                        Navigator.push(
                            context, BouncyPageRoute(widget: CSE3()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white12
                              : Colors.black12.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Color(0xFFE8E8F3),
                              width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "CSE/ISE Semester 3",
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        newTapAd.show();
                        Navigator.push(
                            context, BouncyPageRoute(widget: Civil3()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 49,
                        decoration: BoxDecoration(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white12
                              : Colors.black12.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.black
                                  : Color(0xFFE8E8F3),
                              width: 1),
                        ),
                        child: Center(
                          child: Text(
                            "Civil Engineering Semester 3",
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Text(
                    "©VTUNotes",
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black38
                            : Colors.white38,
                        fontSize: 12),
                  ))
//////                  SizedBox(height: 30),
//////                  FlatButton(
//////                    onPressed: () {
//////                      Navigator.of(context).pop();
//////                      _openSignOutDrawer(context);
//////                    },
//////                    child: FutureBuilder(
//////                      future: Provider.of(context).auth.getCurrentUser(),
//////                      builder: (context, snapshot) {
//////                        if (snapshot.connectionState == ConnectionState.done) {
//////                          return RichText(
//////                            text: TextSpan(children: [
//////                              TextSpan(
//////                                text: "Not ${snapshot.data.displayName}? ",
//////                                style: TextStyle(
//////                                  fontSize: 15,
//////                                  color: Theme.of(context).brightness ==
//////                                          Brightness.dark
//////                                      ? Colors.white
//////                                      : Colors.black,
//////                                  fontWeight: FontWeight.w500,
//////                                ),
//////                              ),
//////                              TextSpan(
//////                                text: "Sign out",
//////                                style: TextStyle(
//////                                  fontSize: 15,
//////                                  color: Theme.of(context).brightness ==
//////                                          Brightness.dark
//////                                      ? Colors.white
//////                                      : Colors.black,
//////                                  decoration: TextDecoration.underline,
//////                                  fontWeight: FontWeight.w500,
//////                                ),
//////                              ),
//////                            ]),
//////                          );
//////                        } else {
//////                          return CircularProgressIndicator();
//////                        }
//////                      },
//////                    ),
//////                  ),
                ],
              ),
              frontLayer: ScaffoldOnly(),
//        body: SwipeDetector(
//          onSwipeRight: () {
//            setState(() {
//              drawerStatus = FSBStatus.FSB_OPEN;
//            });
//          },
//          onSwipeLeft: () {
//            setState(() {
//              drawerStatus = FSBStatus.FSB_CLOSE;
//            });
//          },
//          child: FoldableSidebarBuilder(
//            drawer: CustomDrawer(
//              closeDrawer: () {
//                setState(() {
//                  drawerStatus = FSBStatus.FSB_CLOSE;
//                });
//              },
//            ),
//            screenContents: ScaffoldOnly(),
//            status: drawerStatus,
//          ),
//        ),
//      endDrawer: ClipPath(
//            clipper: _DrawerClipper(),
//            child: SafeArea(
//              child: Drawer(
//                child: Padding(
//                  padding: EdgeInsets.all(20),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//////                    CachedNetworkImage(
//////                        imageUrl:
//////                            "https://cdn.dribbble.com/users/2844289/screenshots/7599355/media/3bcaeb929b0d8fb0b1cc256637cc0a9c.gif",
//////                        imageBuilder: (context, imageProvider) => Container(
//////                              height: 100,
//////                              width: 100,
//////                              margin: EdgeInsets.only(top: 30, bottom: 20),
//////                              decoration: BoxDecoration(
//////                                shape: BoxShape.circle,
//////                                image: DecorationImage(
//////                                  image: imageProvider,
//////                                  fit: BoxFit.cover,
//////                                ),
//////                              ),
//////                            )),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "Hey, ${snapshot.data.displayName}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 17, fontWeight: FontWeight.w500),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 10,
//////                    ),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "${snapshot.data.email}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 15, fontWeight: FontWeight.w400),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 10,
//////                    ),
//////                    FutureBuilder(
//////                        future: Provider.of(context).auth.getCurrentUser(),
//////                        builder: (context, snapshot) {
//////                          if (snapshot.connectionState ==
//////                              ConnectionState.done) {
//////                            return Text(
//////                              "Created: ${DateFormat('MM/dd/yyyy').format(snapshot.data.metadata.creationTime)}",
//////                              style: GoogleFonts.ubuntu(
//////                                  fontSize: 15, fontWeight: FontWeight.w400),
//////                            );
//////                          } else {
//////                            return CircularProgressIndicator();
//////                          }
//////                        }),
//////                    SizedBox(
//////                      height: 30,
//////                    ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            FontAwesomeIcons.bell,
//                            size: 20,
//                          ),
//                          title: Text('Notifications',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            Navigator.push(
//                                context, BouncyPageRoute(widget: HomeScreen()));
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            Feather.book,
//                            size: 18,
//                          ),
//                          title: Text('Syllabus',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            Navigator.push(
//                                context, BouncyPageRoute(widget: sylPage()));
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            MaterialCommunityIcons.pen,
//                            size: 18,
//                          ),
//                          title: Text('Marking Scheme',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            Navigator.push(
//                                context, BouncyPageRoute(widget: MarkingPage()));
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ExpansionTile(
//                          leading: Icon(
//                            Entypo.news,
//                            size: 18,
//                          ),
//                          title: Text('Circulars',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          trailing: Icon(
//                            Icons.arrow_drop_down,
//                            size: 0,
//                          ),
//                          children: <Widget>[
//                            ListTile(
//                              leading: Icon(
//                                Ionicons.ios_paper,
//                                size: 18,
//                              ),
//                              title: Text('Examination',
//                                  style: GoogleFonts.ubuntu(
//                                      fontWeight: FontWeight.bold, fontSize: 15),
//                                  textAlign: TextAlign.center),
//                              onTap: () {
//                                Navigator.pop(context);
//                                launch(
//                                    "https://vtu.ac.in/en/category/exam-circulars-notifications/");
//                              },
//                            ),
//                            ListTile(
//                              leading: Icon(
//                                Ionicons.ios_paper,
//                                size: 18,
//                              ),
//                              title: Text('Administration',
//                                  style: GoogleFonts.ubuntu(
//                                      fontWeight: FontWeight.bold, fontSize: 15),
//                                  textAlign: TextAlign.center),
//                              onTap: () {
//                                Navigator.pop(context);
//                                launch(
//                                    "https://vtu.ac.in/en/category/administration-circulars/");
//                              },
//                            ),
//                          ],
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            MaterialCommunityIcons.trophy,
//                            size: 20,
//                          ),
//                          title: Text('Results',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            launch("https://results.vtu.ac.in/");
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            FontAwesomeIcons.questionCircle,
//                            size: 18,
//                          ),
//                          title: Text('FAQs',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            Navigator.push(
//                                context, BouncyPageRoute(widget: FAQPage()));
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            MaterialIcons.feedback,
//                            size: 18,
//                          ),
//                          title: Text('Feedback',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.of(context).pop();
//                            Wiredash.of(context).show();
//                          },
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(
//                            left: 15.0, right: 15.0, top: 15.0),
//                        child: ListTile(
//                          leading: Icon(
//                            Octicons.settings,
//                            size: 18,
//                          ),
//                          title: Text('Settings',
//                              style: GoogleFonts.ubuntu(
//                                  fontWeight: FontWeight.bold, fontSize: 15),
//                              textAlign: TextAlign.center),
//                          onTap: () {
//                            Navigator.pop(context);
//                            Navigator.push(
//                                context, BouncyPageRoute(widget: About2()));
//                          },
//                        ),
//                      ),
//////                  SizedBox(height: 30),
//////                  FlatButton(
//////                    onPressed: () {
//////                      Navigator.of(context).pop();
//////                      _openSignOutDrawer(context);
//////                    },
//////                    child: FutureBuilder(
//////                      future: Provider.of(context).auth.getCurrentUser(),
//////                      builder: (context, snapshot) {
//////                        if (snapshot.connectionState == ConnectionState.done) {
//////                          return RichText(
//////                            text: TextSpan(children: [
//////                              TextSpan(
//////                                text: "Not ${snapshot.data.displayName}? ",
//////                                style: TextStyle(
//////                                  fontSize: 15,
//////                                  color: Theme.of(context).brightness ==
//////                                          Brightness.dark
//////                                      ? Colors.white
//////                                      : Colors.black,
//////                                  fontWeight: FontWeight.w500,
//////                                ),
//////                              ),
//////                              TextSpan(
//////                                text: "Sign out",
//////                                style: TextStyle(
//////                                  fontSize: 15,
//////                                  color: Theme.of(context).brightness ==
//////                                          Brightness.dark
//////                                      ? Colors.white
//////                                      : Colors.black,
//////                                  decoration: TextDecoration.underline,
//////                                  fontWeight: FontWeight.w500,
//////                                ),
//////                              ),
//////                            ]),
//////                          );
//////                        } else {
//////                          return CircularProgressIndicator();
//////                        }
//////                      },
//////                    ),
//////                  ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//          ),
            ),
          ),
        );
      },
    );
  }
}

//void _openSignOutDrawer(BuildContext context) {
//  showModalBottomSheet(
//      shape: BottomSheetShape(),
//      backgroundColor: Theme.of(context).primaryColor,
//      context: context,
//      builder: (context) {
//        return Container(
//          padding: const EdgeInsets.only(
//            top: 24,
//            bottom: 16,
//            left: 48,
//            right: 48,
//          ),
//          height: 180,
//          child: Column(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Text(
//                "Are you sure you want to sign out?",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 18,
//                  fontWeight: FontWeight.w600,
//                ),
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                mainAxisSize: MainAxisSize.max,
//                children: <Widget>[
//                  Expanded(
//                    child: MaterialButton(
//                      onPressed: () async {
//                        Navigator.pop(context);
//                        try {
//                          await Provider.of(context).auth.signOut();
//                        } catch (e) {
//                          print(e);
//                        }
//                      },
//                      color: Colors.white,
//                      child: Text(
//                        "Sign out",
//                        style: TextStyle(
//                          color: Theme.of(context).primaryColor,
//                          fontSize: 16,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    width: 20,
//                  ),
//                  Expanded(
//                    child: OutlineButton(
//                      onPressed: () {
//                        Navigator.pop(context);
//                      },
//                      borderSide: BorderSide(
//                        color: Colors.white,
//                      ),
//                      color: Colors.white,
//                      child: Text(
//                        "Stay logged in",
//                        style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 16,
//                          fontWeight: FontWeight.w600,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        );
//      });
//}

//final List<Widget> imageSliders = imgList.map((item) => Container(
//  child: Container(
//    margin: EdgeInsets.all(5.0),
//    child: ClipRRect(
//        borderRadius: BorderRadius.all(Radius.circular(5.0)),
//        child: Stack(
//          children: <Widget>[
//            Image.network(item, fit: BoxFit.cover, width: 1000.0),
//            Positioned(
//              bottom: 0.0,
//              left: 0.0,
//              right: 0.0,
//              child: Container(
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: [
//                      Color.fromARGB(200, 0, 0, 0),
//                      Color.fromARGB(0, 0, 0, 0)
//                    ],
//                    begin: Alignment.bottomCenter,
//                    end: Alignment.topCenter,
//                  ),
//                ),
//                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//                child: Text(
//                  'No. ${imgList.indexOf(item)} image',
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ),
//            ),
//          ],
//        )
//    ),
//  ),
//)).toList();

//class CustomDrawer extends StatelessWidget {
//  final Function closeDrawer;
//
//  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Container(
//        color: Theme.of(context).brightness == Brightness.dark
//            ? Color(0xff121212)
//            : Colors.white,
//        width: MediaQuery.of(context).size.width * 0.60,
//        child: ListView(
//          physics: BouncingScrollPhysics(),
//          children: <Widget>[
////////                    CachedNetworkImage(
////////                        imageUrl:
////////                            "https://cdn.dribbble.com/users/2844289/screenshots/7599355/media/3bcaeb929b0d8fb0b1cc256637cc0a9c.gif",
////////                        imageBuilder: (context, imageProvider) => Container(
////////                              height: 100,
////////                              width: 100,
////////                              margin: EdgeInsets.only(top: 30, bottom: 20),
////////                              decoration: BoxDecoration(
////////                                shape: BoxShape.circle,
////////                                image: DecorationImage(
////////                                  image: imageProvider,
////////                                  fit: BoxFit.cover,
////////                                ),
////////                              ),
////////                            )),
////////                    FutureBuilder(
////////                        future: Provider.of(context).auth.getCurrentUser(),
////////                        builder: (context, snapshot) {
////////                          if (snapshot.connectionState ==
////////                              ConnectionState.done) {
////////                            return Text(
////////                              "Hey, ${snapshot.data.displayName}",
////////                              style: GoogleFonts.ubuntu(
////////                                  fontSize: 17, fontWeight: FontWeight.w500),
////////                            );
////////                          } else {
////////                            return CircularProgressIndicator();
////////                          }
////////                        }),
////////                    SizedBox(
////////                      height: 10,
////////                    ),
////////                    FutureBuilder(
////////                        future: Provider.of(context).auth.getCurrentUser(),
////////                        builder: (context, snapshot) {
////////                          if (snapshot.connectionState ==
////////                              ConnectionState.done) {
////////                            return Text(
////////                              "${snapshot.data.email}",
////////                              style: GoogleFonts.ubuntu(
////////                                  fontSize: 15, fontWeight: FontWeight.w400),
////////                            );
////////                          } else {
////////                            return CircularProgressIndicator();
////////                          }
////////                        }),
////////                    SizedBox(
////////                      height: 10,
////////                    ),
////////                    FutureBuilder(
////////                        future: Provider.of(context).auth.getCurrentUser(),
////////                        builder: (context, snapshot) {
////////                          if (snapshot.connectionState ==
////////                              ConnectionState.done) {
////////                            return Text(
////////                              "Created: ${DateFormat('MM/dd/yyyy').format(snapshot.data.metadata.creationTime)}",
////////                              style: GoogleFonts.ubuntu(
////////                                  fontSize: 15, fontWeight: FontWeight.w400),
////////                            );
////////                          } else {
////////                            return CircularProgressIndicator();
////////                          }
////////                        }),
////////                    SizedBox(
////////                      height: 30,
////////                    ),
//            Padding(
//              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  FontAwesomeIcons.bell,
//                  size: 20,
//                ),
//                title: Text('Notifications',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Navigator.push(
//                      context, BouncyPageRoute(widget: HomeScreen()));
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  Feather.book,
//                  size: 18,
//                ),
//                title: Text('Syllabus',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: sylPage()));
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  MaterialCommunityIcons.pen,
//                  size: 18,
//                ),
//                title: Text('Marking Scheme',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Navigator.push(
//                      context, BouncyPageRoute(widget: MarkingPage()));
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ExpansionTile(
//                leading: Icon(
//                  Entypo.news,
//                  size: 18,
//                ),
//                title: Text('Circulars',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                trailing: Icon(
//                  Icons.arrow_drop_down,
//                  size: 0,
//                ),
//                children: <Widget>[
//                  ListTile(
//                    leading: Icon(
//                      Ionicons.ios_paper,
//                      size: 18,
//                    ),
//                    title: Text('Examination',
//                        style: GoogleFonts.ubuntu(
//                            fontWeight: FontWeight.bold, fontSize: 15),
//                        textAlign: TextAlign.center),
//                    onTap: () {
//                      launch(
//                          "https://vtu.ac.in/en/category/exam-circulars-notifications/");
//                      closeDrawer();
//                    },
//                  ),
//                  ListTile(
//                    leading: Icon(
//                      Ionicons.ios_paper,
//                      size: 18,
//                    ),
//                    title: Text('Administration',
//                        style: GoogleFonts.ubuntu(
//                            fontWeight: FontWeight.bold, fontSize: 15),
//                        textAlign: TextAlign.center),
//                    onTap: () {
//                      launch(
//                          "https://vtu.ac.in/en/category/administration-circulars/");
//                      closeDrawer();
//                    },
//                  ),
//                ],
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  MaterialCommunityIcons.trophy,
//                  size: 20,
//                ),
//                title: Text('Results',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  launch("https://results.vtu.ac.in/");
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  FontAwesomeIcons.questionCircle,
//                  size: 18,
//                ),
//                title: Text('FAQs',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: FAQPage()));
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  MaterialIcons.feedback,
//                  size: 18,
//                ),
//                title: Text('Feedback',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Wiredash.of(context).show();
//                  closeDrawer();
//                },
//              ),
//            ),
//            Padding(
//              padding:
//                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
//              child: ListTile(
//                leading: Icon(
//                  Octicons.settings,
//                  size: 18,
//                ),
//                title: Text('Settings',
//                    style: GoogleFonts.ubuntu(
//                        fontWeight: FontWeight.bold, fontSize: 15),
//                    textAlign: TextAlign.center),
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: About2()));
//                  closeDrawer();
//                },
//              ),
//            ),
//            SizedBox(
//              height: 10,
//            ),
//            Divider(),
//            SizedBox(
//              height: 10,
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 20.0, bottom: 12),
//              child: Align(
//                  child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Icon(Icons.flash_on),
//                  Text(
//                    "Most Viewed : ",
//                    style: GoogleFonts.ubuntu(
//                        fontSize: 18, fontWeight: FontWeight.w600),
//                  ),
//                ],
//              )),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: CSE6()));
//                },
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 49,
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).brightness == Brightness.dark
//                        ? Colors.white12
//                        : Colors.black12.withOpacity(0.1),
//                    borderRadius: BorderRadius.circular(12),
//                    border: Border.all(
//                        color: Theme.of(context).brightness == Brightness.dark
//                            ? Colors.black
//                            : Color(0xFFE8E8F3),
//                        width: 1),
//                  ),
//                  child: Center(
//                    child: Text(
//                      "CSE/ISE Semester 6",
//                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: M4()));
//                },
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 49,
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).brightness == Brightness.dark
//                        ? Colors.white12
//                        : Colors.black12.withOpacity(0.1),
//                    borderRadius: BorderRadius.circular(12),
//                    border: Border.all(
//                        color: Theme.of(context).brightness == Brightness.dark
//                            ? Colors.black
//                            : Color(0xFFE8E8F3),
//                        width: 1),
//                  ),
//                  child: Center(
//                    child: Text(
//                      "Engineering Maths 4",
//                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: CSE3()));
//                },
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 49,
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).brightness == Brightness.dark
//                        ? Colors.white12
//                        : Colors.black12.withOpacity(0.1),
//                    borderRadius: BorderRadius.circular(12),
//                    border: Border.all(
//                        color: Theme.of(context).brightness == Brightness.dark
//                            ? Colors.black
//                            : Color(0xFFE8E8F3),
//                        width: 1),
//                  ),
//                  child: Center(
//                    child: Text(
//                      "CSE/ISE Semester 3",
//                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(12.0),
//              child: GestureDetector(
//                onTap: () {
//                  Navigator.push(context, BouncyPageRoute(widget: Civil3()));
//                },
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: 49,
//                  decoration: BoxDecoration(
//                    color: Theme.of(context).brightness == Brightness.dark
//                        ? Colors.white12
//                        : Colors.black12.withOpacity(0.1),
//                    borderRadius: BorderRadius.circular(12),
//                    border: Border.all(
//                        color: Theme.of(context).brightness == Brightness.dark
//                            ? Colors.black
//                            : Color(0xFFE8E8F3),
//                        width: 1),
//                  ),
//                  child: Center(
//                    child: Text(
//                      "Civil Engineering Semester 3",
//                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
//            Center(
//                child: Text(
//              "©VTUNotes",
//              style: GoogleFonts.ubuntu(
//                  fontWeight: FontWeight.w400,
//                  color: Theme.of(context).brightness == Brightness.light
//                      ? Colors.black38
//                      : Colors.white38,
//                  fontSize: 12),
//            ))
////////                  SizedBox(height: 30),
////////                  FlatButton(
////////                    onPressed: () {
////////                      Navigator.of(context).pop();
////////                      _openSignOutDrawer(context);
////////                    },
////////                    child: FutureBuilder(
////////                      future: Provider.of(context).auth.getCurrentUser(),
////////                      builder: (context, snapshot) {
////////                        if (snapshot.connectionState == ConnectionState.done) {
////////                          return RichText(
////////                            text: TextSpan(children: [
////////                              TextSpan(
////////                                text: "Not ${snapshot.data.displayName}? ",
////////                                style: TextStyle(
////////                                  fontSize: 15,
////////                                  color: Theme.of(context).brightness ==
////////                                          Brightness.dark
////////                                      ? Colors.white
////////                                      : Colors.black,
////////                                  fontWeight: FontWeight.w500,
////////                                ),
////////                              ),
////////                              TextSpan(
////////                                text: "Sign out",
////////                                style: TextStyle(
////////                                  fontSize: 15,
////////                                  color: Theme.of(context).brightness ==
////////                                          Brightness.dark
////////                                      ? Colors.white
////////                                      : Colors.black,
////////                                  decoration: TextDecoration.underline,
////////                                  fontWeight: FontWeight.w500,
////////                                ),
////////                              ),
////////                            ]),
////////                          );
////////                        } else {
////////                          return CircularProgressIndicator();
////////                        }
////////                      },
////////                    ),
////////                  ),
//          ],
//        ),
//      ),
//    );
//  }
//}

class ScaffoldOnly extends StatefulWidget {
  @override
  _ScaffoldOnlyState createState() => _ScaffoldOnlyState();
}

class _ScaffoldOnlyState extends State<ScaffoldOnly> {
  bool _isPlaying = false;
  bool _isFullscreen = false;
  bool showAdvertCover = false;
  bool get isPlaying => _isPlaying;
  final ams = AdMobService();

  set isPlaying(bool playing) {
    print("playing  $playing");
    _isPlaying = playing;
  }

  @override
  void initState() {
    super.initState();
  }

  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    InterstitialAd newTapAd = ams.getNewTapInterstitial();
    newTapAd.load();
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection("Quotes").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Theme.of(context).brightness == Brightness.dark
                  ? SpinKitWave(
                      color: Colors.black,
                    )
                  : SpinKitWave(
                      color: Colors.white,
                    );
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RaisedButton(
                    onPressed: (){
                      Navigator.push(context,
                          BouncyPageRoute(widget: TodoApp()));
                    },
                  ),
                  FadeIn(
                    1,
                    Container(
                      height: 100,
//                  color: Colors.orange[100],
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/spark.gif'),
                            fit: BoxFit.cover),
                      ),
                      child: Text(
                        snapshot.data.documents[6]['engquote1'],
                        style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  FadeIn(
                    1.5,
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(left: 16, right: 16),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: Swiper(
                                onIndexChanged: (index) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                autoplayDelay: 4000,
                                physics: BouncingScrollPhysics(),
                                loop: true,
                                autoplay: true,
                                layout: SwiperLayout.DEFAULT,
                                itemCount: carousels.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl: snapshot.data.documents[index]
                                          ['carousel1'],
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(
                          carousels,
                          (index, image) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: 6,
                              width: 6,
                              margin: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.blue
                                      : Colors.grey),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
//          SizedBox(
//              height: 279,
//              width: MediaQuery.of(context).size.width,
//              child: Carousel(
//                autoplay: true,
//                images: [
//                  CachedNetworkImage(
//                      imageUrl:
//                          'https://i.ytimg.com/vi/3BVQ9Scdglg/maxresdefault.jpg'),
//                  CachedNetworkImage(
//                      imageUrl:
//                          'https://www.redcross.org/content/dam/redcross/about-us/news/2020/positivity2tw.jpg.transform/1288/q70/feature/image.jpeg'),
//                  CachedNetworkImage(
//                      imageUrl:
//                          'https://www.un.org/sustainabledevelopment/wp-content/uploads/2020/03/SG-quote.jpeg'),
//                  CachedNetworkImage(
//                      imageUrl:
//                          'https://i.ytimg.com/vi/EMBFnHbl1as/maxresdefault.jpg'),
//                ],
//                animationCurve: Curves.decelerate,
//                autoplayDuration: Duration(seconds: 4),
//                animationDuration: Duration(seconds: 1),
//                dotSize: 0.0,
//                indicatorBgPadding: 0.0,
//                borderRadius: false,
//              )),
//        SizedBox(
//          height: 223,
//          width: MediaQuery.of(context).size.width,
//          child: CarouselSlider(
//            options: CarouselOptions(
//              autoPlay: true,
//              enableInfiniteScroll: true,
//            ),
//            items: imgList.map((item) => Container(
//              child: Center(
//                  child: CachedNetworkImage(imageUrl: item, fit: BoxFit.cover, width: 1000)
//              ),
//            )).toList(),
//          ),
//        ),
                  Padding(
                    padding: EdgeInsets.only(top: 19, left: 25),
                    child: Text(
                      'Question Papers',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Theme.of(context).brightness == Brightness.dark
                      ? Divider(
                          color: Colors.white54,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        )
                      : Divider(
                          color: Colors.black12,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        ),
                  FadeIn(
                    1.7,
                    Container(
                      height: 144,
                      margin: EdgeInsets.only(top: 25, right: 16, left: 16),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    newTapAd.show();
                                    Navigator.push(context,
                                        BouncyPageRoute(widget: BCSQP()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Color(0xFFE8E8F3),
                                          width: 1),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? CachedNetworkImage(
                                                color: Colors.white,
                                                imageUrl:
                                                    "https://i.ibb.co/GFdWnMS/artificial-intelligence.png",
                                                fit: BoxFit.contain,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    "https://i.ibb.co/GFdWnMS/artificial-intelligence.png",
                                                fit: BoxFit.contain,
                                              ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Computer Science",
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text("Question Papers",
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    newTapAd.show();
                                    Navigator.push(context,
                                        BouncyPageRoute(widget: BMECHQP()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Color(0xFFE8E8F3),
                                          width: 1),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? CachedNetworkImage(
                                                color: Colors.white,
                                                imageUrl:
                                                    "https://i.ibb.co/BV7BpxP/transportation.png",
                                                fit: BoxFit.contain,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    "https://i.ibb.co/BV7BpxP/transportation.png",
                                                fit: BoxFit.contain,
                                              ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Mechanical",
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text("Question Papers",
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    newTapAd.show();
                                    Navigator.push(context,
                                        BouncyPageRoute(widget: BCIVILQP()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Color(0xFFE8E8F3),
                                          width: 1),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? CachedNetworkImage(
                                                color: Colors.white,
                                                imageUrl:
                                                    "https://i.ibb.co/hDxrfSs/build.png",
                                                fit: BoxFit.contain,
                                              )
                                            : CachedNetworkImage(
                                                imageUrl:
                                                    "https://i.ibb.co/hDxrfSs/build.png",
                                                fit: BoxFit.contain,
                                              ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Civil Engineering",
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text("Question Papers",
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    newTapAd.show();
                                    Navigator.push(context,
                                        BouncyPageRoute(widget: BECEQP()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 8),
                                    padding: EdgeInsets.only(left: 16),
                                    height: 64,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.black
                                              : Color(0xFFE8E8F3),
                                          width: 1),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        CachedNetworkImage(
                                          imageUrl:
                                              "https://i.ibb.co/pnXxtsG/gear.png",
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "ECE",
                                                style: GoogleFonts.ubuntu(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text("Question Papers",
                                                  style: GoogleFonts.ubuntu(
                                                      color: Colors.grey)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 25),
                    child: Text(
                      'Placement Materials',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Theme.of(context).brightness == Brightness.dark
                      ? Divider(
                          color: Colors.white54,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        )
                      : Divider(
                          color: Colors.black12,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        ),
                  FadeIn(
                    2,
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 20),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(
                                    context,
                                    BouncyPageRoute(
                                        widget: InfosysPlacement()));
                              },
                              child: Container(
                                height: 64,
                                width: MediaQuery.of(context).size.width - 300,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xFFE8E8F3),
                                      width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      width: 100,
                                      height: 100,
                                      imageUrl:
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Infosys_logo.svg/400px-Infosys_logo.svg.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(
                                    context,
                                    BouncyPageRoute(
                                        widget: AccenturePlacement()));
                              },
                              child: Container(
                                  height: 64,
                                  width:
                                      MediaQuery.of(context).size.width - 300,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Color(0xFFE8E8F3),
                                        width: 1),
                                  ),
                                  child: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? CachedNetworkImage(
                                          color: Colors.white,
                                          imageUrl:
                                              "https://cdn.freebiesupply.com/images/large/2x/accenture-logo-png-transparent.png",
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              "https://cdn.freebiesupply.com/images/large/2x/accenture-logo-png-transparent.png",
                                        )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(context,
                                    BouncyPageRoute(widget: WiproPlacement()));
                              },
                              child: Container(
                                  height: 64,
                                  width:
                                      MediaQuery.of(context).size.width - 300,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.black
                                        : Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Color(0xFFE8E8F3),
                                        width: 1),
                                  ),
                                  child: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CachedNetworkImage(
                                              height: 80,
                                              width: 80,
                                              color: Colors.white,
                                              imageUrl:
                                                  "https://i.ibb.co/GH6zHD7/wipro-limited-vector-logo-removebg-preview.png",
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            CachedNetworkImage(
                                              height: 80,
                                              width: 80,
                                              imageUrl:
                                                  "https://i.ibb.co/GH6zHD7/wipro-limited-vector-logo-removebg-preview.png",
                                            ),
                                          ],
                                        )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(
                                    context,
                                    BouncyPageRoute(
                                        widget: MindTreePlacement()));
                              },
                              child: Container(
                                height: 64,
                                width: MediaQuery.of(context).size.width - 300,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xFFE8E8F3),
                                      width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      width: 100,
                                      height: 100,
                                      imageUrl:
                                          "https://3.bp.blogspot.com/-ungDy8ffHFs/UGd2GmAT7oI/AAAAAAAANjU/EwsRb_mXJQI/s1600/Mindtree+logo+2012.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(context,
                                    BouncyPageRoute(widget: TCSPlacement()));
                              },
                              child: Container(
                                height: 64,
                                width: MediaQuery.of(context).size.width - 300,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xFFE8E8F3),
                                      width: 1),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/TATA_Consultancy_Services_Logo_blue.svg/1200px-TATA_Consultancy_Services_Logo_blue.svg.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                newTapAd.show();
                                Navigator.push(
                                    context,
                                    BouncyPageRoute(
                                        widget: TechMahPlacement()));
                              },
                              child: Container(
                                height: 64,
                                width: MediaQuery.of(context).size.width - 300,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.black
                                          : Color(0xFFE8E8F3),
                                      width: 1),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://riftio.com/wp-content/uploads/2017/02/r_logos_Tech-Mahindra.png",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 25),
                    child: Text(
                      'List of Branches',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Theme.of(context).brightness == Brightness.dark
                      ? Divider(
                          color: Colors.white54,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        )
                      : Divider(
                          color: Colors.black12,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: ComputerScience(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            0.1,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19, top: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/711Z2XWDsqL.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Computer Science/ISE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-7",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: ComputerScience(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            0.1,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19, top: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/711Z2XWDsqL.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Computer Science/ISE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-7",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: PCycle(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            0.3,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://qph.fs.quoracdn.net/main-qimg-001c9404762e23dcbcb88bf3cb4896b6.webp",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Basic Science",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Physics Cycle",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: PCycle(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            0.3,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://qph.fs.quoracdn.net/main-qimg-001c9404762e23dcbcb88bf3cb4896b6.webp",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Basic Science",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Physics Cycle",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: CCycle(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.0,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/51n8jYtQ3bL._SX356_BO1,204,203,200_.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Basic Science",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Chemistry Cycle",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: CCycle(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/51n8jYtQ3bL._SX356_BO1,204,203,200_.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Basic Science",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Chemistry Cycle",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: Maths(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://m.media-amazon.com/images/I/5102f8trNKL.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Department of Mathematics",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 1-4",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: Maths(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://m.media-amazon.com/images/I/5102f8trNKL.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Department of Mathematics",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 1-4",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: ECENotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.3,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://i.pinimg.com/originals/8f/75/9f/8f759fdba16c449533a34edcbf6ac535.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("ECE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-6",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: ECENotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.3,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://i.pinimg.com/originals/8f/75/9f/8f759fdba16c449533a34edcbf6ac535.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("ECE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-6",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: EEENotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.5,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://i1.wp.com/easyengineering.net/wp-content/uploads/2018/02/images-7-1.jpg?fit=485%2C686&ssl=1",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("EEE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-5",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: EEENotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.5,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://i1.wp.com/easyengineering.net/wp-content/uploads/2018/02/images-7-1.jpg?fit=485%2C686&ssl=1",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("EEE",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-5",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: CivilNotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.7,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://5.imimg.com/data5/YM/BK/GLADMIN-4755675/civil-engineering-book-500x500.png",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Civil Engineering",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-8",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: CivilNotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            1.7,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://5.imimg.com/data5/YM/BK/GLADMIN-4755675/civil-engineering-book-500x500.png",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Civil Engineering",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-8",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Theme.of(context).brightness == Brightness.dark
                      ? GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: MECHNotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            2,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/416FvgSOOCL._SX367_BO1,204,203,200_.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Mechanical Engineering",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-5",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            newTapAd.show();
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: MECHNotes(),
                                    duration: Duration(milliseconds: 100)));
                          },
                          child: FadeIn(
                            2,
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: 25),
                                margin: EdgeInsets.only(bottom: 19),
                                height: 81,
                                width: MediaQuery.of(context).size.width - 50,
                                child: Row(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          new SpinKitFadingCircle(
                                        color: Colors.deepPurple,
                                      ),
                                      imageUrl:
                                          "https://images-na.ssl-images-amazon.com/images/I/416FvgSOOCL._SX367_BO1,204,203,200_.jpg",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        width: 62,
                                        height: 81,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          image: DecorationImage(
                                              image: imageProvider),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 15),
                                              blurRadius: 23,
                                              spreadRadius: -13,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 21,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Mechanical Engineering",
                                            style: GoogleFonts.openSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Notes",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Sem 3-5",
                                            style: GoogleFonts.openSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 25),
                    child: Text(
                      'Stay Inspired',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Theme.of(context).brightness == Brightness.dark
                      ? Divider(
                          color: Colors.white54,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        )
                      : Divider(
                          color: Colors.black12,
                          thickness: 1,
                          indent: 25,
                          endIndent: 250,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Container(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black54
                          : Colors.white30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          snapshot.data.documents[4]['vidT'],
                          style: GoogleFonts.ubuntu(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      right: 16,
                      left: 16,
                      bottom: 20,
                    ),
                    child: snapshot.data.documents[5]['vids'] != ""
                        ? AwsomeVideoPlayer(
                            snapshot.data.documents[5]['vids'],
                            playOptions: VideoPlayOptions(
                                seekSeconds: 30,
                                aspectRatio: 4 / 3,
                                loop: false,
                                autoplay: false,
                                allowScrubbing: true,
                                startPosition: Duration(seconds: 0)),
                            videoStyle: VideoStyle(
                              playIcon: Icon(
                                Icons.play_circle_filled,
                                size: 100,
                                color: Colors.white,
                              ),
                              showPlayIcon: true,
                              videoControlBarStyle: VideoControlBarStyle(
                                progressStyle: VideoProgressStyle(
                                    playedColor: Colors.red,
                                    bufferedColor: Colors.yellow,
                                    backgroundColor: Colors.green,
                                    dragBarColor: Colors.white,
                                    height: 4,
                                    progressRadius: 2,
                                    dragHeight: 5),
                                playIcon: Icon(Icons.play_arrow,
                                    color: Colors.white, size: 16),
                                pauseIcon: Icon(
                                  Icons.pause,
                                  color: Colors.red,
                                  size: 16,
                                ),
                                rewindIcon: Icon(
                                  Icons.replay_30,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                forwardIcon: Icon(
                                  Icons.forward_30,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                fullscreenIcon: Icon(
                                  Icons.fullscreen,
                                  size: 0,
                                  color: Colors.white,
                                ),
                              ),
                              videoTopBarStyle: VideoTopBarStyle(
                                show: false,
                              ),
                            ),
                            onplay: (value) {
                              print("video played");
                              setState(() {
                                _isPlaying = true;
                              });
                            },
                            onended: (value) {
                              print("video ended");
                            },
                            ontimeupdate: (value) {},
                            onprogressdrag: (position, duration) {
                              print("Dragged： ${position}");
                              print("Dragged： ${duration}");
                            },
                            onvolume: (value) {
                              print("onvolume ${value}");
                            },
                            onbrightness: (value) {
                              print("onbrightness ${value}");
                            },
                            onfullscreen: (fullscreen) {
                              print("is fullscreen $fullscreen");
                              setState(() {
                                _isFullscreen = fullscreen;
                              });
                            },
                            onpop: (value) {
                              print("Aight");
                            },
                          )
                        : Container(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black54
                                    : Colors.white54,
                            child: AspectRatio(
                              aspectRatio: 4 / 3,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  backgroundColor:
                                      Theme.of(context).brightness ==
                                              Brightness.light
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

enum _AniProps { opacity, translateX }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, 0.0.tweenTo(1.0))
      ..add(_AniProps.translateX, 130.0.tweenTo(0.0));

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: (300 * delay).round().milliseconds,
      duration: 500.milliseconds,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateX), 0),
          child: child,
        ),
      ),
    );
  }
}
