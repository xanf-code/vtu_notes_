import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ECE4 extends StatefulWidget {
  @override
  _ECE4State createState() => _ECE4State();
}

class _ECE4State extends State<ECE4> {

  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _subjects =[];
  bool _loadingSubjects = true;

  _getSubjects() async {
    Query q = _firestore.collection("ECESEM4").orderBy("id");

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
        child: _subjects.length == 0 ? Center(
          child: SpinKitWave(
            color: Colors.deepPurple,
            size: 50.0,
          ),
        ) : ListView.builder(physics: BouncingScrollPhysics(),itemCount: _subjects.length ,itemBuilder: (BuildContext ctx, int index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 24, left: 25),
                child: Text(
                  _subjects[index].data["name"],
                  style: GoogleFonts.ubuntu(
                      fontSize: 27, fontWeight: FontWeight.w600),
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
                  _subjects[index].data["description"],
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
                  "Select Module :",
                  style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 49,
                color: Colors.transparent,
                child: _subjects[index].data["module1"] != "Null" ?
                FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () => launch(_subjects[index].data["module1"]),
                  child: Text(
                    "Module 1",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ) : FlatButton(
                  disabledColor: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white70
                      : Colors.black12,
                  disabledTextColor: Colors.black,
                  child:
                  Text("Notes will be updated soon"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 49,
                color: Colors.transparent,
                child: _subjects[index].data["module2"] != "Null" ?
                FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () => launch(_subjects[index].data["module2"]),
                  child: Text(
                    "Module 2",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ) : FlatButton(
                  disabledColor: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white70
                      : Colors.black12,
                  disabledTextColor: Colors.black,
                  child:
                  Text("Notes will be updated soon"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 49,
                color: Colors.transparent,
                child: _subjects[index].data["module3"] != "Null" ?
                FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () => launch(_subjects[index].data["module3"]),
                  child: Text(
                    "Module 3",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ) : FlatButton(
                  disabledColor: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white70
                      : Colors.black12,
                  disabledTextColor: Colors.black,
                  child:
                  Text("Notes will be updated soon"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 49,
                color: Colors.transparent,
                child: _subjects[index].data["module4"] != "Null" ?
                FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () => launch(_subjects[index].data["module4"]),
                  child: Text(
                    "Module 4",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ) : FlatButton(
                  disabledColor: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white70
                      : Colors.black12,
                  disabledTextColor: Colors.black,
                  child:
                  Text("Notes will be updated soon"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
                width: MediaQuery.of(context).size.width,
                height: 49,
                color: Colors.transparent,
                child: _subjects[index].data["module5"] != "Null" ?
                FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () => launch(_subjects[index].data["module5"]),
                  child: Text(
                    "Module 5",
                    style: GoogleFonts.ubuntu(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ) : FlatButton(
                  disabledColor: Theme.of(context).brightness ==
                      Brightness.dark
                      ? Colors.white70
                      : Colors.black12,
                  disabledTextColor: Colors.black,
                  child:
                  Text("Notes will be updated soon"),
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
