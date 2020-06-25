import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AccenturePlacement extends StatefulWidget {
  @override
  _AccenturePlacementState createState() => _AccenturePlacementState();
}

class _AccenturePlacementState extends State<AccenturePlacement> {
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
                          "https://www.businessinsider.in/thumb/msid-75801262,width-600,resizemode-4,imgsize-219084/enterprise/news/accenture-adds-nearly-50-data-scientists-and-engineers-to-its-payroll-by-acquiring-byte-propechy-in-india/accenture-acquired-ahmedabad-based-byte-propechy.jpg",
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wrZWmaV89rO9g71L0-KikH_7EzJBVpcw/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ): //practice1_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1wrZWmaV89rO9g71L0-KikH_7EzJBVpcw/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ),//practice1_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1x4QuwtUX_xi3CLf-hBJ5p1e5ajT-tk9Y/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ): //practice2_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1x4QuwtUX_xi3CLf-hBJ5p1e5ajT-tk9Y/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ),//practice2_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xQth8F_tsukPnkzNgXqY011KcTSarf7P/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ): //practice3_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xQth8F_tsukPnkzNgXqY011KcTSarf7P/view?usp=sharing"),
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
                                              text: "Practice\n",
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
                            ),//practice3_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xHpksBSk-_-ilwRkjcC9gCnFsmpq1nrU/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 4",
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
                            ): //practice4_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xHpksBSk-_-ilwRkjcC9gCnFsmpq1nrU/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 4",
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
                            ),//practice4_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1x7x6yUJfDpZXhReCufyfOsqh-wXRi1iF/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 5",
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
                            ): //practice5_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1x7x6yUJfDpZXhReCufyfOsqh-wXRi1iF/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 5",
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
                            ),//practice5_white
                            Theme.of(context).brightness == Brightness.dark ?
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xEXP681iMvZpdIkGFrWLvzYbtXucc5sg/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)
                                          ),
                                          TextSpan(
                                              text: "Paper 6",
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
                            ): //practice6_black
                            GestureDetector(
                              onTap: ()=> launch("https://drive.google.com/file/d/1xEXP681iMvZpdIkGFrWLvzYbtXucc5sg/view?usp=sharing"),
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
                                              text: "Practice\n",
                                              style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.pink)
                                          ),
                                          TextSpan(
                                              text: "Paper 6",
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
                            ),//practice6_white
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
