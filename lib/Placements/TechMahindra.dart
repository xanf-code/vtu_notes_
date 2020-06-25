import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TechMahPlacement extends StatefulWidget {
  @override
  _TechMahPlacementState createState() => _TechMahPlacementState();
}

class _TechMahPlacementState extends State<TechMahPlacement> {
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
                          "https://www.thestatesman.com/wp-content/uploads/2020/01/iStock-862163612_ED.jpg",
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
                            GestureDetector (
                              onTap: ()=> launch("https://drive.google.com/file/d/1wkeijsaI_Y_tlhAKTSeeqCE6I69xYwCI/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wkeijsaI_Y_tlhAKTSeeqCE6I69xYwCI/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wmJYTSxczGfTUl39mb7x3jx_I7xgA6c9/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wmJYTSxczGfTUl39mb7x3jx_I7xgA6c9/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wZmhpSBxis2tj40x9S3-2AICiWZK4pbc/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wZmhpSBxis2tj40x9S3-2AICiWZK4pbc/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wafZASduR7RvW4Pic-_Lzz1pEsRE9cKg/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wafZASduR7RvW4Pic-_Lzz1pEsRE9cKg/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wozROlBhr8qC0hHyokTrU9WgZ5J426am/view?usp=sharing"),
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
                              onTap: ()=> launch("https://drive.google.com/file/d/1wozROlBhr8qC0hHyokTrU9WgZ5J426am/view?usp=sharing"),
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
