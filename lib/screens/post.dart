import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/models/models.dart';
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class PostScreen extends StatelessWidget {
  final Post post;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const PostScreen({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VTU Updates"),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "${post.title}",
              style:
                  GoogleFonts.ubuntu(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Html(
            customTextAlign: (_) => TextAlign.left,
            defaultTextStyle: GoogleFonts.ubuntu(
              fontSize: 16,
            ),
            imageProperties: ImageProperties(
              fit: BoxFit.fitWidth,
              matchTextDirection: true,
              height: MediaQuery.of(context).size.width * 0.7,
            ),
            data: post.content,
            //Optional parameters:
            padding: EdgeInsets.all(5.0),
            linkStyle: const TextStyle(
              color: Colors.blueAccent,
              decorationColor: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),

            onLinkTap: (url) => _launchURL("$url"),
            customRender: (node, children) {
              print(node);
              if (node is dom.Element) {
                switch (node.localName) {
                  case "custom_tag":
                    return Column(children: children);
                }
              }
            },
          ),
        ],
      )),
    );
    // bottomNavigationBar: BottomAppBar(
    //   child: Bar,
    // )
  }
}
