import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/loginScreen/otpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Phonevereficaion extends StatefulWidget {
  static String verify = "";
  const Phonevereficaion({super.key});

  @override
  State<Phonevereficaion> createState() => PhonevereficaionState();
}

class PhonevereficaionState extends State<Phonevereficaion> {
  bool isCecked = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController mobileNumber = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      setState(() {
        loading = false;
      });
    });
    return Scaffold(
        body: Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(AppImg.appLogo)),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Login With Mobile Number",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "We need to register your phone number before getting started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Color.fromARGB(255, 231, 231, 231),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "+91",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: mobileNumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusColor: Colors.red,
                                filled: true,
                                fillColor: Color.fromARGB(255, 231, 231, 231),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide:
                                      new BorderSide(color: Colors.transparent),
                                ),
                                hintText: " Mobile Number"),
                            validator: (value) {
                              if (value!.isEmpty || value == null) {
                                return "Enter Mobile Number";
                              }
                              if (value.length != 10) {
                                return 'Mobile Number Must Be 10 Digits!';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FullRounedButton(
                      title: "Sing in",
                      loading: loading,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });

                          await FirebaseAuth.instance
                              .verifyPhoneNumber(
                                  phoneNumber: '+91${mobileNumber.text}',
                                  verificationCompleted:
                                      (PhoneAuthCredential credential) {},
                                  verificationFailed:
                                      (FirebaseAuthException e) {},
                                  codeSent: (String verificationId,
                                      int? resendToken) {
                                    Phonevereficaion.verify = verificationId;
                                    print(verificationId);
                                    print(resendToken);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => otpScreen(
                                                  mobileNumber:
                                                      mobileNumber.text,
                                                )));
                                  },
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {})
                              .onError((error, stackTrace) {});
                          setState(() {
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
