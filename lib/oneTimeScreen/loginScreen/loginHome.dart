import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/loginScreen/createAccount.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Image(
              image: AssetImage(AppImg.loginHome),
              height: 250,
            ),
            const Text(
              "Let's you in",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    loginWith(AppImg.facebook, "Continue With Facebook"),
                    const SizedBox(
                      height: 15,
                    ),
                    loginWith(AppImg.google, "Continue With Google"),
                    const SizedBox(
                      height: 15,
                    ),
                    loginWith(AppImg.apple, "Continue With Apple"),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 125, 125, 125),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 125, 125, 125),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: FullRounedButton(
                          title: "Sing in with Password", onPressed: () {}),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateAccount()));
                          },
                          child: Text(
                            "Sing up",
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 114, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget loginWith(String img, String title) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Color.fromARGB(255, 130, 130, 130))),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 247, 247, 247)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(img),
              height: 40,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
