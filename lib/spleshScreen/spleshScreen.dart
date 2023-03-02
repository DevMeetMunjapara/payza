import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payza/home.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';

var loginMobileNumber;

class SplashServices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    loginMobileNumber = user?.phoneNumber;
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Phonevereficaion()));
    }
  }
}
