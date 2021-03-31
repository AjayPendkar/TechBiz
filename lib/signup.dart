import 'package:flutter/material.dart';
import 'package:fluttergooglesigninapp/register.dart';

import 'googlesignin.dart';
// import 'package:flutter_login_signup/src/loginPage.dart';
// import 'package:flutter_login_signup/src/signup.dart';

class Signup extends StatefulWidget {
  static String routeName;

  Signup({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Widget _google() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GoogleSignApp()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xffdf8e33).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.green),
        child: Text(
          'Sign in',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _register() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Registration()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Text(
          'SignUp',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  // Widget _text() {
  //   return InkWell(
  //     // onTap: () {
  //     //   Navigator.push(
  //     //       context, MaterialPageRoute(builder: (context) => SignUpPage()));
  //     // },
  //     child: Container(
  //       child: Column(
  //         children: [Text("SignUp to CHAT")],
  //       ),
  //     ),
  //   );
  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Well Come To CHAT',
        style: TextStyle(
          // textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _subtitle() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Free Messaging ,Voice and Video Calls more!',
        style: TextStyle(
          // textStyle: Theme.of(context).textTheme.display1,
          fontSize: 15,

          color: Colors.black,
        ),
      ),
    );
  }

  Widget _logo() {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => SignUpPage()));
      // },
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              // image: AssetImage("assets/logo1.gif"),
              image: AssetImage('assets/logo3.png'),
              fit: BoxFit.fill),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     // colors: [Color(0xF8F9F9), Color(0xff3030F4)]
            //     )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logo(),
              SizedBox(
                height: 10,
              ),
              _title(),
              SizedBox(
                height: 40,
              ),
              _subtitle(),

              // _text(),
              SizedBox(
                height: 50,
              ),
              _google(),
              SizedBox(
                height: 20,
              ),

              _register(),
              SizedBox(
                height: 20,
              ),
              //  _label()
            ],
          ),
        ),
      ),
    );
  }
}
