import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/home.dart';
import 'package:payza/oneTimeScreen/loadingScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/phoneVerefication.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class otpScreen extends StatefulWidget {
  var mobileNumber = "";
  otpScreen({
    super.key,
    required this.mobileNumber,
  });

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  var code = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 25),
        alignment: Alignment.center,
        child: Column(
          children: [
            const MyAppBar(),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              AppImg.appLogo,
              width: 300,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "OTP Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Code has been send to +91 ${widget.mobileNumber}",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Pinput(
              length: 6,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(
              height: 30,
            ),
            FullRounedButton(
                title: "Verify Phone Number",
                onPressed: () async {
                  try {
                    setState(() {
                      loading = true;
                    });
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: Phonevereficaion.verify,
                            smsCode: code);
                    final FirebaseAuth auth = FirebaseAuth.instance;

                    await auth.signInWithCredential(credential).then((value) {
                      loginMobileNumber == widget.mobileNumber;
                      // ignore: use_build_context_synchronously
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false);
                    });

                    setState(() {
                      loading = false;
                    });
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                  }
                })
          ],
        ),
      ),
    );
  }
}
