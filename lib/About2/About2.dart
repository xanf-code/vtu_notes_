import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:launch_review/launch_review.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtunotes/Pages/credits.dart';
import 'package:vtunotes/Shape/bottomsheet.dart';
import 'package:vtunotes/animation/bouncy.dart';
import 'package:vtunotes/form/form.dart';
import 'package:vtunotes/widgets/provider_widget.dart';


class About2 extends StatefulWidget {

  @override
  _About2State createState() => _About2State();
}

class _About2State extends State<About2> {
  AppUpdateInfo _updateInfo;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) => _showError(e));
  }

  void _showError(dynamic exception) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(exception.toString())));
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;
    double paddingBottom = mediaQueryData.padding.bottom;


    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: widthScreen,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildWidgetBackgroundCoverAlbum(widthScreen, context),
                _buildWidgetListMusic(context, paddingBottom, widthScreen, heightScreen),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetListMusic(BuildContext context, double paddingBottom, double widthScreen, double heightScreen) {
    bool _theme = Theme.of(context).brightness == Brightness.dark ? true : false;
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 12.0,bottom: 8.0),
                child: Text(
                  'Settings',
                  style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 24.0),
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        FontAwesomeIcons.upload,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Submit Notes", style: GoogleFonts.ubuntu()),
                    onTap: () {
                      Navigator.push(context, BouncyPageRoute(widget: UploaderForm()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.library_books,
                      color: Colors.purple,
                    ),
                    title: Text("Terms & Conditions",
                        style: GoogleFonts.ubuntu()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("""By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Darshan Aswath.

Darshan Aswath is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.

The VTUNotes app stores and processes personal data that you have provided to us, in order to provide my Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the VTUNotes app won’t work properly or at all.

The app does use third party services that declare their own Terms and Conditions.

Link to Terms and Conditions of third party service providers used by the app

Google Play Services
AdMob
Google Analytics for Firebase
Firebase Crashlytics
You should be aware that there are certain things that Darshan Aswath will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Darshan Aswath cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.

If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.

Along the same lines, Darshan Aswath cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Darshan Aswath cannot accept responsibility.

With respect to Darshan Aswath’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Darshan Aswath accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.

At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Darshan Aswath does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.

Changes to This Terms and Conditions

I may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page.

These terms and conditions are effective as of 2020-04-16

Contact Us

If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact me at darshanaswath@gmail.com.""",style: GoogleFonts.ubuntu(),),
                              ),
                            );
                          });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.fileContract,
                      color: Colors.purple,
                    ),
                    title:
                    Text("Privacy Policy", style: GoogleFonts.ubuntu()),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("""Author Darshan Aswath built the VTUNotes app as an Ad Supported app. This SERVICE is provided by Darshan Aswath at no cost and is intended for use as is.

This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.

If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.

The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at VTUNotes unless otherwise defined in this Privacy Policy.

Information Collection and Use

For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Name,EmaiID. The information that I request will be retained on your device and is not collected by me in any way.

The app does use third party services that may collect information used to identify you.

Link to privacy policy of third party service providers used by the app

Google Play Services
AdMob
Google Analytics for Firebase
Firebase Crashlytics
Log Data

I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.

Cookies

Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.

This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.

Service Providers

I may employ third-party companies and individuals due to the following reasons:

To facilitate our Service;
To provide the Service on our behalf;
To perform Service-related services; or
To assist us in analyzing how our Service is used.
I want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.

Security

I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.

Links to Other Sites

This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Children’s Privacy

These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.

Changes to This Privacy Policy

I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 2020-04-16

Contact Us

If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at darshanaswath@gmail.com.""",style: GoogleFonts.ubuntu(),),
                              ),
                            );
                          });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.share,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Invite a friend",
                      style: GoogleFonts.ubuntu(),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      Share.share('Check Out VTUNotes app for all VTU Notes, Question papers, Placement Materials and more https://play.google.com/store/apps/details?id=com.notes.vtunotes');
                    },
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.purple,
                      ),
                      title: Text("Email", style: GoogleFonts.ubuntu()),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () => launch("mailto:darshanaswath@gmail.com?subject=VTUNotes App")
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        Icons.cloud_circle,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Environment", style: GoogleFonts.ubuntu()),
                    subtitle:
                    Text("Production", style: GoogleFonts.ubuntu()),
                    onTap: () {
                      //open change location
                    },
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        Icons.insert_chart,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Version", style: GoogleFonts.ubuntu()),
                    subtitle: Text("v1.0.0", style: GoogleFonts.ubuntu()),
                    onTap: () {
                      //open change location
                    },
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        Icons.star_half,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Rate us", style: GoogleFonts.ubuntu()),
                    onTap: () => LaunchReview.launch(
                      androidAppId: "com.notes.vtunotes",
                    ),),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        FontAwesome5.handshake,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Credits", style: GoogleFonts.ubuntu()),
                    onTap: () {
                      Navigator.push(context, BouncyPageRoute(widget: Credits()));
                    },
                  ),
                  ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Icon(
                        Icons.update,
                        color: Colors.purple,
                      ),
                    ),
                    title: Text("Check for updates", style: GoogleFonts.ubuntu()),
                    onTap: () => checkForUpdate(),
                  ),
                  ListTile(
                    leading: Icon(
                      Entypo.log_out,
                      color: Colors.purple,
                    ),
                    title: Text("Sign Out", style: GoogleFonts.ubuntu()),
                    onTap: () {
                      _openSignOutDrawer(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "App Theme Settings",
                  style: GoogleFonts.ubuntu(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Theme.of(context).brightness == Brightness.light ?
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: _theme,
                  title: Text("Space Mode",style: GoogleFonts.ubuntu(),),
                  subtitle: Text("Get that whiteness out of my sight",style: GoogleFonts.ubuntu(),),
                  onChanged: (bool value){
                    DynamicTheme.of(context).setBrightness(
                        Theme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light);
                  },
                ),
              ) :
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: _theme,
                  title: Text("Flash Bang",style: GoogleFonts.ubuntu(),),
                  subtitle: Text("Need Some light",style: GoogleFonts.ubuntu(),),
                  onChanged: (bool value){
                    DynamicTheme.of(context).setBrightness(
                        Theme.of(context).brightness == Brightness.light
                            ? Brightness.dark
                            : Brightness.light);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Notification Settings",
                  style: GoogleFonts.ubuntu(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SwitchListTile(
                  activeColor: Colors.purple,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Receive App Updates",style: GoogleFonts.ubuntu(),),
                  onChanged: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetBackgroundCoverAlbum(double widthScreen, BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider("https://cdn.dribbble.com/users/77121/screenshots/10010364/media/ab7b4d1c22d3616066394686cc20bd9c.gif"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: widthScreen / 2.5,
              height: widthScreen / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider("https://cdn.dribbble.com/users/1208043/screenshots/4355090/hello7a.gif"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 15.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: widthScreen / 1.5),
                FutureBuilder(
                    future: Provider.of(context).auth.getCurrentUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Text(
                          "Hey, ${snapshot.data.displayName}",
                          style: GoogleFonts.ubuntu(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness ==
                                Brightness.dark
                                ? Colors.white
                                : Colors.white,
                          ),
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: Colors.white,
                          size: 35,
                        );
                      }
                    }),
                SizedBox(height: 4.0),
                FutureBuilder(
                    future: Provider.of(context).auth.getCurrentUser(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Text(
                          "Email :  ${snapshot.data.email}",
                          style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness ==
                                Brightness.dark
                                ? Colors.white
                                : Colors.white,
                          ),
                        );
                      } else {
                        return SpinKitFadingCircle(
                          color: Colors.white,
                          size: 35,
                        );
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
void _openSignOutDrawer(BuildContext context) {
  showModalBottomSheet(
      shape: BottomSheetShape(),
      backgroundColor: Theme.of(context).primaryColor,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 16,
            left: 48,
            right: 48,
          ),
          height: 180,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Are you sure you want to sign out?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        try {
                          Navigator.pop(context);
                          await Provider.of(context).auth.signOut();
                        } catch (e) {
                          print(e);
                        }
                      },
                      color: Colors.white,
                      child: Text(
                        "Sign out",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      child: Text(
                        "Stay logged in",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
}