import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NotifPush extends StatefulWidget {
  @override
  _NotifPushState createState() => _NotifPushState();
}

class _NotifPushState extends State<NotifPush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Color(0xff121212),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xff121212)
            : Colors.white,
        title: Text(
          'Push Notifications',
          style: GoogleFonts.ubuntu(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Color(0xff121212),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("post").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SpinKitWave(color: Colors.deepPurple,
                  size: 50.0,),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot mypost = snapshot.data.documents[index];
                    return InkWell(
                      onTap: () => launch(mypost['link']),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Material(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                                elevation: 14.0,
                                shadowColor: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white12
                                    : Color(0x802196F3),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200.0,
                                          child: CachedNetworkImage(
                                            imageUrl: mypost['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          mypost['title'],
                                          style: GoogleFonts.ubuntu(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          mypost['subtitle'],
                                          style: GoogleFonts.ubuntu(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white70
                                                  : Colors.blueGrey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
