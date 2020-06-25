import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class InfosysPlacement extends StatefulWidget {
  @override
  _InfosysPlacementState createState() => _InfosysPlacementState();
}

class _InfosysPlacementState extends State<InfosysPlacement> {
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
                        "https://www.infosys.com/content/dam/infosys-web/en/american-innovation/Images/american-innovation-10.jpg",
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
                            onTap: () => launch("https://drive.google.com/file/d/1xw5wTnDJyNPbSuUg-zx5KAWyeqCe_lMw/view?usp=sharing"),
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
                                            text: "Aptitude\n",
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
                          ): //aptitude_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1xw5wTnDJyNPbSuUg-zx5KAWyeqCe_lMw/view?usp=sharing"),
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
                                            text: "Aptitude\n",
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
                          ), //aptitude_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: () => launch("https://drive.google.com/file/d/1y3aKdOdYIyUDK9_LkK2NW3OOPvTTT-UM/view?usp=sharing"),
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
                                            text: "English\n",
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
                          ): //English_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1y3aKdOdYIyUDK9_LkK2NW3OOPvTTT-UM/view?usp=sharing"),
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
                                            text: "English\n",
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
                          ),//English_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yANX6-lIXXEt7Iu8h1JknJZ3pI0AlQE8/view?usp=sharing"),
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
                                            text: "Reasoning\n",
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
                          ): //Reasoning_paper1_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yANX6-lIXXEt7Iu8h1JknJZ3pI0AlQE8/view?usp=sharing"),
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
                                            text: "Reasoning\n",
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
                          ),//Reasoning_paper1_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yH41HVTAeP087mdPE79v4CGMBP5BzPdM/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yH41HVTAeP087mdPE79v4CGMBP5BzPdM/view?usp=sharing"),
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
                            onTap: () => launch("https://drive.google.com/file/d/1yFAbU2szANbDHU3UcBE8BmcJF7Uwopdc/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yFAbU2szANbDHU3UcBE8BmcJF7Uwopdc/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1ySoKdq_zPL1mSFIvCmdB7ttf-OxK1BCb/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1ySoKdq_zPL1mSFIvCmdB7ttf-OxK1BCb/view?usp=sharing"),
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
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yIjG5dQLPo_NANZIioJJnFN7p9cYApG0/view?usp=sharing"),
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
                          ): //placement4_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yIjG5dQLPo_NANZIioJJnFN7p9cYApG0/view?usp=sharing"),
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
                          ),//placement4_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yNuqGiLN4-8WNTyEHANtLMXi_XHTyRYv/view?usp=sharing"),
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
                          ): //placement5_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yNuqGiLN4-8WNTyEHANtLMXi_XHTyRYv/view?usp=sharing"),
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
                          ),//placement5_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1y_YtAXMt8XMf2VC50OPHTb6Eyl6Kyx5P/view?usp=sharing"),
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
                          ): //placement6_black
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1y_YtAXMt8XMf2VC50OPHTb6Eyl6Kyx5P/view?usp=sharing"),
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
                          ),//placement6_white
                          Theme.of(context).brightness == Brightness.dark ?
                          GestureDetector(
                            onTap: ()=> launch("https://drive.google.com/file/d/1yxi7D57h9gprwK30pBgjRJsb5Wek1PIM/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yxi7D57h9gprwK30pBgjRJsb5Wek1PIM/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yvhbsYZvm8yeSP4mXKpc8uiY75lC1mU0/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yvhbsYZvm8yeSP4mXKpc8uiY75lC1mU0/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yozssRLs1RErptZCM3xSpD2wbGk3t5G9/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yozssRLs1RErptZCM3xSpD2wbGk3t5G9/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yj61FZk6yT3lHqonb-lxn-regSpUiPDY/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yj61FZk6yT3lHqonb-lxn-regSpUiPDY/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yeriIQaCRC8mObZOjSNgsJEkQpk7RiLj/view?usp=sharing"),
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
                            onTap: ()=> launch("https://drive.google.com/file/d/1yeriIQaCRC8mObZOjSNgsJEkQpk7RiLj/view?usp=sharing"),
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
