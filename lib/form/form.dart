import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:vtunotes/form/controller.dart';
import 'package:vtunotes/form/upload_form.dart';
import 'package:vtunotes/admob_services/admob_service.dart';
import 'package:admob_flutter/admob_flutter.dart';


class UploaderForm extends StatefulWidget {
  @override
  _UploaderFormState createState() => _UploaderFormState();
}

class _UploaderFormState extends State<UploaderForm> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final ams = AdMobService();

  @override
  void initState() {
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  // TextField Controllers
  TextEditingController branchController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController moduleController = TextEditingController();
  TextEditingController drivelinkController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
          branchController.text,
          semesterController.text,
          subjectController.text,
          moduleController.text,
          drivelinkController.text);

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          showDialog(
              context: context,
              builder: (_) => NetworkGiffyDialog(
                    image : Image(image: CachedNetworkImageProvider("https://cdn.dribbble.com/users/448124/screenshots/2177658/qq-.gif")),
                    title: Text('Thank you for the contribution',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600)),
                    description: Text(
                      'The study material has been successfully submitted, once verified the material will be uploaded',
                      textAlign: TextAlign.center,
                    ),
                    buttonOkColor: Colors.deepPurple,
                    entryAnimation: EntryAnimation.BOTTOM,
                onlyOkButton: true,
                onOkButtonPressed: (){
                      Navigator.pop(context);
                },
                  ));
//          _showSnackbar("Notes Submitted");
        } else {
          _showSnackbar("Error Occurred!");
        }
      });
      FocusScope.of(context).unfocus();
//      _showSnackbar("Submitting Notes");

      formController.submitForm(feedbackForm);
    }
  }

  _showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white,
        content: Text(
          message,
          style: GoogleFonts.ubuntu(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.black),
        ));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

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
          title: Text(
            'Material Submission',
            style: GoogleFonts.ubuntu(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Color(0xff121212),
            ),
          ),
        ),
        key: _scaffoldKey,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 100,
                        child: Marquee(
                          text:
                              'This platform provides notes and question banks of Engineering subjects prepared by experienced faculties, upload any available VTU Engineering material and Let us help each other in studying!',
                          style:
                              GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                          scrollAxis: Axis.horizontal,
                          blankSpace: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          velocity: 100.0,
                          pauseAfterRound: Duration(seconds: 1),
                          startPadding: 10.0,
                          accelerationDuration: Duration(seconds: 1),
                          accelerationCurve: Curves.linear,
                          decelerationDuration: Duration(milliseconds: 500),
                          decelerationCurve: Curves.easeOut,
                        ),
                      ),
                      Container(
                        child: AdmobBanner(
                          adUnitId: ams.getBannerAdId(),
                          adSize: AdmobBannerSize.FULL_BANNER,
                        ),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.title.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 50),
                            children: [
                              TextSpan(
                                text: "VTU",
                                style: TextStyle(color: Colors.grey),
                              ),
                              TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "NOTES",
                                    style: TextStyle(
                                        color: Colors.orange, fontSize: 50),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Send us some study materials.",
                          maxLines: 2,
                          style: GoogleFonts.ubuntu(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Have some good notes? Send it to us to get your notes upload on VTUNotes. Let's help each other in studying!",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Steps for submission of study material : \n"
                          "1. Upload the material in you Google Drive\n"
                          "2. Make the document PUBLIC and copy the PUBLIC link of your material\n"
                          "3. Paste the link in the Drive Link section Below\n"
                          "4. Make sure the author name is visible in the document submitted\n"
                          "5. Click on submit material and wait for the confirmation toast\n",
                          style: GoogleFonts.ubuntu(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70.withOpacity(0.2)
                                    : Colors.black87.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: branchController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              return null;
                            },
                            style: GoogleFonts.ubuntu(fontSize: 15.0),
                            decoration: InputDecoration(
                                prefixIcon: Icon(FontAwesomeIcons.codeBranch),
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Branch Name",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70.withOpacity(0.2)
                                    : Colors.black87.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: semesterController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              return null;
                            },
                            style: GoogleFonts.ubuntu(fontSize: 15.0),
                            decoration: InputDecoration(
                                prefixIcon: Icon(FontAwesomeIcons.pen),
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Semester",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70.withOpacity(0.2)
                                    : Colors.black87.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: subjectController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              return null;
                            },
                            style: GoogleFonts.ubuntu(fontSize: 15.0),
                            decoration: InputDecoration(
                                prefixIcon: Icon(FontAwesomeIcons.bookOpen),
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Subject Name",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70.withOpacity(0.2)
                                    : Colors.black87.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: moduleController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              return null;
                            },
                            style: GoogleFonts.ubuntu(fontSize: 15.0),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(FontAwesomeIcons.sortNumericUp),
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Module",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70.withOpacity(0.2)
                                    : Colors.black87.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: drivelinkController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Field cannot be empty";
                              }
                              return null;
                            },
                            style: GoogleFonts.ubuntu(fontSize: 15.0),
                            decoration: InputDecoration(
                                prefixIcon: Icon(FontAwesomeIcons.googleDrive),
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Drive Link",
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: InkWell(
                            onTap: _submitForm,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Center(
                                  child: Text(
                                'Submit Notes',
                                style: GoogleFonts.ubuntu(
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.white),
                              )),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
