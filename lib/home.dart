import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final auth = FirebaseAuth.instance;
              await auth.signOut().then((value) => Navigator.pushAndRemoveUntil(
                  context as BuildContext,
                  MaterialPageRoute(builder: (context) => Phonevereficaion()),
                  (route) => false));
            }),
      ),
    );
  }
}
