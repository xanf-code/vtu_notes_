import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/homepage.dart';
import 'package:vtunotes/screens/error.dart';
import 'package:vtunotes/screens/post.dart';
import 'package:vtunotes/screens/result.dart';
import 'package:vtunotes/screens/search.dart';
import 'package:vtunotes/services/auth_service.dart';
import 'package:vtunotes/views/first_view.dart';
import 'package:vtunotes/views/sign_up_view.dart';
import 'package:vtunotes/widgets/provider_widget.dart';
import 'package:wiredash/wiredash.dart';
import 'package:splashscreen/splashscreen.dart';

import 'admob_services/admob_service.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  runApp(MyApp());
}

class MyTranslation extends WiredashOptionsData{
  @override
  bool get showDebugFloatingEntryPoint => false;
}

class MyApp extends StatelessWidget {
  @override
  final _navigatorKey = GlobalKey<NavigatorState>();

  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness) {
        return ThemeData(
            primaryColor: Colors.black,
            brightness: brightness == Brightness.light
                ? Brightness.light
                : Brightness.dark,
            scaffoldBackgroundColor: brightness == Brightness.dark
                ? Color(0xff121212)
                : Colors.white);
      },
      themedWidgetBuilder: (context, theme) {
        return Provider(
          auth: AuthService(),
          child: Wiredash(
            theme: WiredashThemeData(brightness: Brightness.dark),
            navigatorKey: _navigatorKey,
            projectId: "vtunotes-06baa0i",
            secret: "khnxyt07kldn0zkyqtobny182nxhav98",
            child: MaterialApp(
              navigatorKey: _navigatorKey,
              debugShowCheckedModeBanner: false,
              theme: theme,
              home: Splash(),
              routes: <String, WidgetBuilder>{
                '/home': (BuildContext context) => HomeController(),
                '/signUp': (BuildContext context) =>
                    SignUpView(authFormType: AuthFormType.signUp),
                '/signIn': (BuildContext context) =>
                    SignUpView(authFormType: AuthFormType.signIn),
                '/anonymousSignIn': (BuildContext context) =>
                    SignUpView(authFormType: AuthFormType.anonymous),
                '/convertUser': (BuildContext context) =>
                    SignUpView(authFormType: AuthFormType.convert),
              },
              onGenerateRoute: (RouteSettings settings) {
                final args = settings.arguments;
                switch (settings.name) {
                  case "/search":
                    return MaterialPageRoute(
                      builder: (_) => SearchScreen(
                        search: args,
                      ),
                    );
                    break;
                  case "/result":
                    return MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        search: args,
                      ),
                    );
                    break;
                  case "/post":
                    return MaterialPageRoute(
                      builder: (_) => PostScreen(
                        post: args,
                      ),
                    );
                    break;
                  default:
                    return MaterialPageRoute(builder: (_) => ErrorScreen());
                    break;
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? MyHomePage() : FirstView();
        }
        return SpinKitCircle(
          color: Colors.white,
          size: 30,
        );
      },
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new HomeController(),
        image: Image(
          image: CachedNetworkImageProvider("https://cdn.dribbble.com/users/3395339/screenshots/12028646/media/a07a64ecc020373aa69506c7f849ea0a.gif"),
        ),
        backgroundColor: Colors.white,
        photoSize: 200.0,
        loadingText: Text('Welcome to VTUNotes',
          style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.black,
          ),),
        loaderColor: Colors.black
    );
  }
}