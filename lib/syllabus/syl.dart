import 'package:admob_flutter/admob_flutter.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtunotes/admob_services/admob_service.dart';

class sylPage extends StatefulWidget {
  @override
  _sylPageState createState() => _sylPageState();
}

class _sylPageState extends State<sylPage> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _subjects =[];
  bool _loadingSubjects = true;
  final ams = AdMobService();

  _getSubjects() async {
    Query q = _firestore.collection("Syllabus").orderBy("Code");

    setState(() {
      _loadingSubjects = true;
    });

    QuerySnapshot querySnapshot = await q.getDocuments();

    _subjects = querySnapshot.documents;
    setState(() {
      _loadingSubjects = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSubjects();
    Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Syllabus",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600,color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Color(0xff121212),)),
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Color(0xff121212),
        ),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xff121212)
            : Colors.white,
      ),
      body: Container(
        child: _subjects.length == 0 ? Center(
          child: SpinKitWave(
            color: Colors.deepPurple,
            size: 50.0,
          ),
        ) : ListView.builder(physics: BouncingScrollPhysics(),itemCount: _subjects.length ,itemBuilder: (BuildContext ctx, int index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTileCard(
              elevation: 1,
              title: Text(_subjects[index].data["Branches"]),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Branch Code : "),
                    Text(_subjects[index].data["Code"]),
                  ],
                ),
              ),
              children: <Widget>[
                Container(
                  child: AdmobBanner(
                    adUnitId: ams.getBannerAdId(),
                    adSize: AdmobBannerSize.FULL_BANNER,
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  height: 1.0,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () => launch(_subjects[index].data["Syllabus"]),
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.open_in_browser),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        Share.share('Check Out ${_subjects[index].data["Branches"]} Syllabus Copy ${_subjects[index].data["Syllabus"]}', subject: 'Look what I made!');
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.share),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Share'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
