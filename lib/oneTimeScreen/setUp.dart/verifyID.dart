import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/setUp.dart/showContry.dart';

class VerifyID extends StatefulWidget {
  const VerifyID({super.key});

  @override
  State<VerifyID> createState() => _VerifyIDState();
}

class _VerifyIDState extends State<VerifyID> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.only(left: 10, right: 15),
        child: Column(
          children: [
            MyAppBar(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 17, right: 17),
              child: Column(
                children: const [
                  const Text(
                    "Reason for Using Payza",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "We want to provide the best experience \naccording fo your needs",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Image(image: AssetImage(AppImg.verifyID))
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: FullRounedButton(
            title: "Verify identity",
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShowContry()));
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
