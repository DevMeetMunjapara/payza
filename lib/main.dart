import 'package:flutter/material.dart';
import 'package:payza/home.dart';
import 'package:payza/oneTimeScreen/loadingScreen.dart';
import 'package:payza/oneTimeScreen/intro/introScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/cretaeAccount.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';
import 'package:payza/oneTimeScreen/setUp.dart/resonPayza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

bool isOnboarding = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
