import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MindTreePlacement extends StatefulWidget {
  @override
  _MindTreePlacementState createState() => _MindTreePlacementState();
}

class _MindTreePlacementState extends State<MindTreePlacement> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Color(0xfff121212)
                            : Color(0xffffffff),
                        child: CachedNetworkImage(
                          imageUrl:
                          "https://upload.wikimedia.org/wikipedia/en/3/35/MindTree_Chennai_Campus.JPG",
                          imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                              )
                          ),
                        ),
                      )],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,top: 16),
                    child: Text("Select Materials : ",style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xVgIdZR58Jr9sn8X0Og2E7wQcC8-iBNW/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(38.5),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 1",
                                              style: GoogleFonts.ubuntu(color: Colors.white60)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ): //placement1_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xVgIdZR58Jr9sn8X0Og2E7wQcC8-iBNW/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(38.5),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0,10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 1",
                                              style: GoogleFonts.ubuntu(color: Colors.black87)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),//placement1_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: () => launch("https://drive.google.com/file/d/1xWMCNJ0VGPhKGgxZlN-rdYjrVExttegg/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(38.5),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 2",
                                              style: GoogleFonts.ubuntu(color: Colors.white60)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ): //placement2_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xWMCNJ0VGPhKGgxZlN-rdYjrVExttegg/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(38.5),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0,10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 2",
                                              style: GoogleFonts.ubuntu(color: Colors.black87)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),//placement2_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xRZPjsOaZb5mf5CmnuTHfXbOdn4CQBdq/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(38.5),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 3",
                                              style: GoogleFonts.ubuntu(color: Colors.white60)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ): //placement3_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xRZPjsOaZb5mf5CmnuTHfXbOdn4CQBdq/view?usp=sharing"),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(38.5),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0,10),
                                      blurRadius: 33,
                                      color: Color(0xFFD3D3D3).withOpacity(.84),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "Placement\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 3",
                                              style: GoogleFonts.ubuntu(color: Colors.black87)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),//placement3_white
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ]
        ),
      ),
    );
  }
}
