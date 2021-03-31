import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'ProfileScreen.dart';

class GoogleSignApp extends StatefulWidget {
  @override
  _GoogleSignAppState createState() => _GoogleSignAppState();
}

class _GoogleSignAppState extends State<GoogleSignApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text('Sign in'),
    ));

    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        await _firebaseAuth.signInWithCredential(credential);
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new ProfileScreen(detailsUser: details),
      ),
    );
    return userDetails;
  }

  Widget _facebook() {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => null()));
      // },
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
            color: Colors.blue[900]),
        child: Text(
          'LOGIN WITH FACEBOOK',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _google() {
    return InkWell(
      // onTap: () {
      //   Navigator.push(
      //       context, MaterialPageRoute(builder: (context) => null()));
      // },
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
            color: Colors.blue[900]),
        child: Text(
          'LOGIN WITH FACEBOOK',
          style: TextStyle(fontSize: 20, color: Color(0xfff7892b)),
        ),
      ),
    );
  }

  Widget _discription() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sign up with your registered phone number to get started ',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'If you linked your account toFacebook,you can also login in that way',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: 'Sign up to CHAT',
        style: TextStyle(
          // textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.green,
        ),
        // children: [
        //   TextSpan(
        //     text: 'to CHAT',
        //     style: TextStyle(color: Colors.black, fontSize: 30),
        //   ),
        //   // TextSpan(
        //   //   text: 'rnz',
        //   //   style: TextStyle(color: Colors.white, fontSize: 30),
        //   // ),
        // ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      //   title: Text(
      //     "CHAt APP",
      //     style: TextStyle(
      //       color: Colors.blue,
      //     ),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 100, 20, 20),
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
          //     // colors: [Color(0xff3030F4), Color(0xF8F9F9)]

          //     )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) => Stack(
              fit: StackFit.expand,
              children: <Widget>[
                //  Container(
                //    width: MediaQuery.of(context).size.width,
                //    height:  MediaQuery.of(context).size.height,
                //       child: Image.network(
                //          'https://images.unsplash.com/photo-1518050947974-4be8c7469f0c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
                //          ,fit: BoxFit.fill,
                //          color: Color.fromRGBO(255, 255, 255, 0.6),
                //         colorBlendMode: BlendMode.modulate
                //       ),
                //     ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _title(),
                    SizedBox(height: 50.0),
                    _discription(),
                    SizedBox(height: 250.0),
                    InkWell(
                      onTap: () => _signIn(context)
                          .then((FirebaseUser user) => print(user))
                          .catchError((e) => print(e)),
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
                            color: Colors.blue[600]),
                        child: Text(
                          'LOGIN WITH GOOGLE',
                          style:
                              TextStyle(fontSize: 20, color: Color(0xfff7892b)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _facebook(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}
