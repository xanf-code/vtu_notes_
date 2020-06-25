import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vtunotes/services/auth_service.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vtunotes/widgets/provider_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

final primaryColor = const Color(0xFF75A2EA);

enum AuthFormType { signIn, signUp, reset, anonymous, convert }

class SignUpView extends StatefulWidget {
  final AuthFormType authFormType;
  SignUpView({Key key, @required this.authFormType}) : super(key: key);

  @override
  _SignUpViewState createState() =>
      _SignUpViewState(authFormType: this.authFormType);
}

class _SignUpViewState extends State<SignUpView> {
  AuthFormType authFormType;

  _SignUpViewState({this.authFormType});

  final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } else if (state == 'home') {
      Navigator.of(context).pop();
    } else {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  bool validate() {
    final form = formKey.currentState;
    if (authFormType == AuthFormType.anonymous) {
      return true;
    }
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        switch (authFormType) {
          case AuthFormType.signIn:
            await auth.signInWithEmailAndPassword(_email, _password);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.signUp:
            await auth.createUserWithEmailAndPassword(
                _email, _password, _name);
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.reset:
            await auth.sendPasswordResetEmail(_email);
            _warning = "A password reset link has been sent to $_email";
            setState(() {
              authFormType = AuthFormType.signIn;
            });
            break;
          case AuthFormType.anonymous:
            await auth.singInAnonymously();
            Navigator.of(context).pushReplacementNamed('/home');
            break;
          case AuthFormType.convert:
            await auth.convertUserWithEmail(_email, _password, _name);
            Navigator.of(context).pop();
            break;
        }
      } catch (e) {
        print(e);
        setState(() {
          _warning = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    if (authFormType == AuthFormType.anonymous) {
      submit();
      return SafeArea(
        child: Scaffold(
            backgroundColor: primaryColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitDoubleBounce(
                  color: Colors.white,
                ),
                Text(
                  "Loading",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 10, 153, 1.0),
                    Color.fromRGBO(245, 50, 111, 1.0),
                  ]),
            ),
            height: _height,
            width: _width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  showAlert(),
                  SizedBox(height: _height * 0.025),
                  buildHeaderText(),
                  SizedBox(height: _height * 0.025),
                  Container(
                    child: SizedBox(
                      child: SvgPicture.asset("assets/signup.svg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: buildInputs() + buildButtons(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget showAlert() {
    if (_warning != null) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(0, 10, 153, 1.0),
                Color.fromRGBO(245, 50, 111, 1.0),
              ]),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline,color: Colors.white,),
            ),
            Expanded(
              child: AutoSizeText(
                _warning,
                style: GoogleFonts.ubuntu(color: Colors.white,fontWeight: FontWeight.bold),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close,color: Colors.white,),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  AutoSizeText buildHeaderText() {
    String _headerText;
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Sign In";
    } else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset Password";
    } else {
      _headerText = "Create New Account";
    }
    return AutoSizeText(
      _headerText,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
        fontSize: 35,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

  List<Widget> buildInputs() {
    List<Widget> textFields = [];
    if (authFormType == AuthFormType.reset) {
      textFields.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.2),
            borderRadius: BorderRadius.circular(29),
          ),
          child: TextFormField(
            enableSuggestions: true,
            validator: EmailValidator.validate,
            style: TextStyle(fontSize: 15.0),
            decoration: buildSignUpInputDecoration("Email"),
            onSaved: (value) => _email = value,
          ),
        ),
      );
      textFields.add(SizedBox(height: 20));
      return textFields;
    }

    // if were in the sign up state add name
    if ([AuthFormType.signUp, AuthFormType.convert].contains(authFormType)) {
      textFields.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.2),
            borderRadius: BorderRadius.circular(29),
          ),
          child: TextFormField(
            validator: NameValidator.validate,
            style: TextStyle(fontSize: 15.0),
            decoration: buildSignUpInputDecoration("Enter Name"),
            onSaved: (value) => _name = value,
          ),
        ),
      );
      textFields.add(SizedBox(height: 20));
    }

    // add email & password
    textFields.add(
      Container(
        decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.2),
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextFormField(
          validator: EmailValidator.validate,
          style: GoogleFonts.ubuntu(fontSize: 15.0),
          decoration: buildSignUpInputDecoration("Enter Email"),
          onSaved: (value) => _email = value,
        ),
      ),
    );
    textFields.add(SizedBox(height: 20));
    textFields.add(
      Container(
        decoration: BoxDecoration(
          color: Colors.white70.withOpacity(0.2),
          borderRadius: BorderRadius.circular(29),
        ),
        child: TextFormField(
          validator: PasswordValidator.validate,
          style: GoogleFonts.ubuntu(fontSize: 15.0),
          decoration: buildSignUpInputDecoration("Enter Password"),
          obscureText: true,
          onSaved: (value) => _password = value,
        ),
      ),
    );
    textFields.add(SizedBox(height: 20));

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: InputBorder.none,
//      filled: true,
      hintStyle: GoogleFonts.ubuntu(color: Colors.white.withOpacity(0.6)),
      errorStyle: GoogleFonts.ubuntu(color: Colors.white),
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  List<Widget> buildButtons() {
    String _switchButtonText, _newFormState, _submitButtonText;
    bool _showForgotPassword = false;
    bool _showSocial = true;

    if (authFormType == AuthFormType.signIn) {
      _switchButtonText = "Create New Account";
      _newFormState = "signUp";
      _submitButtonText = "Sign In";
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset) {
      _switchButtonText = "Return to Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Submit";
      _showSocial = false;
    } else if (authFormType == AuthFormType.convert) {
      _switchButtonText = "Cancel";
      _newFormState = "home";
      _submitButtonText = "Sign Up";
    } else {
      _switchButtonText = "Have an Account? Sign In";
      _newFormState = "signIn";
      _submitButtonText = "Sign Up";
    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          elevation: 9,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          textColor: primaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 34),
            child: Text(
              _submitButtonText,
              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: submit,
        ),
      ),
      SizedBox(height: 5,),
      showForgotPassword(_showForgotPassword),
      FlatButton(
        child: Text(
          _switchButtonText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          switchFormState(_newFormState);
        },
      ),
      buildSocialIcons(_showSocial),
    ];
  }

  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            authFormType = AuthFormType.reset;
          });
        },
      ),
      visible: visible,
    );
  }

  Widget buildSocialIcons(bool visible) {
    final _auth = Provider.of(context).auth;
    return Visibility(
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.white,
          ),
          SizedBox(height: 10),
          GoogleSignInButton(
            splashColor: Colors.deepPurple,
            borderRadius: 5.0,
            text: "Sign in using Google",textStyle: GoogleFonts.ubuntu(fontSize: 17,color: Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.black),
            onPressed: () async {
              try {
                if(authFormType == AuthFormType.convert) {
                  await _auth.convertWithGoogle();
                  Navigator.of(context).pop();
                } else {
                  await _auth.signInWithGoogle();
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              } catch (e) {
                setState(() {
                  print(e);
                  _warning = e.message;
                });
              }
            },
          ),
          SizedBox(height: 10,),
          Container(
            child: Text("All your information is encrypted 🔐",style: GoogleFonts.ubuntu(fontSize: 14,color: Colors.white),),
          ),
        ],
      ),
      visible: visible,
    );
  }
}
