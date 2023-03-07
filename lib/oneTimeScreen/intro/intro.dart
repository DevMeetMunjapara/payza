import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/home.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/intro/introScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';
import 'package:payza/oneTimeScreen/setUp.dart/resonPayza.dart';
import 'package:payza/spleshScreen/spleshScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

var loginMobileNumber;

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _introState();
}

class _introState extends State<Intro> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerScreen();
  }

  timerScreen() async {
    await Future.delayed(Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final bool showHome;
      showHome = prefs.getBool('showHome') ?? false;
      print("-------$showHome");
      // final _auth = FirebaseAuth.instance;
      // final user = _auth.currentUser;
      if (showHome == true) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ResonPayza()),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => IntroScreen()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(AppImg.intro),
      height: double.infinity,
    );
  }
}
