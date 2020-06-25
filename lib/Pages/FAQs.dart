import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/DataSource/datasource.dart';

class FAQPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Text('FAQs',style: GoogleFonts.ubuntu(color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Color(0xff121212),),),),
        body: ListView.builder(
            itemCount: DataSource.questionAnswers.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(
                  DataSource.questionAnswers[index]['question'],
                  style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(DataSource.questionAnswers[index]['answer'],style: GoogleFonts.ubuntu(color: Colors.grey),),
                  )
                ],
              );
            }),
      ),
    );
  }
}