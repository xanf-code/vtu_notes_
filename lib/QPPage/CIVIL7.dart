import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class CIV7QP extends StatefulWidget {
  @override
  _CIV7QPState createState() => _CIV7QPState();
}

class _CIV7QPState extends State<CIV7QP> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _subjects = [];
  bool _loadingSubjects = true;

  _getSubjects() async {
    Query q = _firestore.collection("CIVILSEM7QP").orderBy("Subject");

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _subjects.length == 0
            ? Center(
              child: SpinKitWave(
                color: Colors.deepPurple,
                size: 50.0,
              ),
            )
            : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: _subjects.length,
            itemBuilder: (BuildContext ctx, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 24, left: 25),
                    child: Text(
                      _subjects[index].data["Subject"],
                      style: GoogleFonts.ubuntu(
                          fontSize: 27, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 28,
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "Select Year :",
                      style: GoogleFonts.ubuntu(
                          fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    color: Colors.transparent,
                    child: _subjects[index].data["decjan18"] != "Null"
                        ? FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () =>
                          launch(_subjects[index].data["decjan18"]),
                      child: Text(
                        "Dec/Jan 18",
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        : FlatButton(
                      disabledColor: Theme.of(context).brightness ==
                          Brightness.dark
                          ? Colors.white70
                          : Colors.black12,
                      disabledTextColor: Colors.black,
                      child:
                      Text("Dec/Jan 18 (Will be updated Soon)"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                      margin:
                      EdgeInsets.only(left: 25, right: 25, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      height: 49,
                      color: Colors.transparent,
                      child: _subjects[index].data["decjan17"] != "Null"
                          ? FlatButton(
                        color: Colors.deepPurple,
                        onPressed: () =>
                            launch(_subjects[index].data["decjan17"]),
                        child: Text(
                          "Dec/Jan 17",
                          style: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                          : FlatButton(
                        disabledColor: Theme.of(context).brightness ==
                            Brightness.dark
                            ? Colors.white70
                            : Colors.black12,
                        disabledTextColor: Colors.black,
                        child:
                        Text("Dec/Jan 17 (Will be updated Soon)"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  Container(
                    margin:
                    EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    color: Colors.transparent,
                    child: _subjects[index].data["decjan19"] != "Null"
                        ? FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () =>
                          launch(_subjects[index].data["decjan19"]),
                      child: Text(
                        "Dec/Jan 19",
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        : FlatButton(
                      disabledColor: Theme.of(context).brightness ==
                          Brightness.dark
                          ? Colors.white70
                          : Colors.black12,
                      disabledTextColor: Colors.black,
                      child:
                      Text("Dec/Jan 19 (Will be updated Soon)"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    color: Colors.transparent,
                    child: _subjects[index].data["junjuly17"] != "Null"
                        ? FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () =>
                          launch(_subjects[index].data["junjuly17"]),
                      child: Text(
                        "June/July 17",
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        : FlatButton(
                      disabledColor: Theme.of(context).brightness ==
                          Brightness.dark
                          ? Colors.white70
                          : Colors.black12,
                      disabledTextColor: Colors.black,
                      child:
                      Text("June/July 17 (Will be updated Soon)"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 49,
                    color: Colors.transparent,
                    child: _subjects[index].data["junjuly18"] != "Null"
                        ? FlatButton(
                      color: Colors.deepPurple,
                      onPressed: () =>
                          launch(_subjects[index].data["junjuly18"]),
                      child: Text(
                        "June/July 18",
                        style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                        : FlatButton(
                      disabledColor: Theme.of(context).brightness ==
                          Brightness.dark
                          ? Colors.white70
                          : Colors.black12,
                      disabledTextColor: Colors.black,
                      child:
                      Text("June/July 18 (Will be updated Soon)"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
