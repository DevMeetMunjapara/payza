import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/home.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/intro/intro.dart';
import 'package:payza/oneTimeScreen/intro/introScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';
import 'package:payza/spleshScreen/spleshScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

var loginMobileNumber;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerScreen();
  }

  timerScreen() async {
    await Future.delayed(Duration(seconds: 2), () async {
      final _auth = FirebaseAuth.instance;
      final user = _auth.currentUser;
      if (user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Intro()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(""),
            const Image(
              image: AssetImage("img/payza.png"),
              height: 400,
            ),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? PrimaryColor : Colors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
