import 'package:flutter/material.dart';
import 'package:payza/home.dart';
import 'package:payza/oneTimeScreen/LoadingScreen.dart';
import 'package:payza/oneTimeScreen/introScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/loginHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isOnboarding = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
