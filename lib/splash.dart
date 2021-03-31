import 'package:flutter/material.dart';
import 'package:fluttergooglesigninapp/signup.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Signup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   radius: 60,
                //   backgroundImage: AssetImage(
                //     'assets/logo1.jpeg',
                //   ),
                // ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        // image: AssetImage("assets/logo1.gif"),
                        image: AssetImage('assets/logo2.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                // Text('CHAT',
                //     style: TextStyle(
                //         fontSize: 22,
                //         fontWeight: FontWeight.w600,
                //         color: Colors.orange)),
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
