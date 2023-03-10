import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/setUp.dart/cameraApp.dart';

class ProofOf extends StatefulWidget {
  const ProofOf({super.key});

  @override
  State<ProofOf> createState() => _ProofOfState();
}

class _ProofOfState extends State<ProofOf> {
  bool isCecked1 = false;
  bool isCecked2 = false;
  bool isCecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyAppBar(),
            Container(
              margin: EdgeInsets.only(left: 17, right: 17),
              child: Column(
                children: [
                  const Text(
                    "Proof Of Residency",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Prove you live in India",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Netionality",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 241, 241, 241),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          width: 40,
                          image: AssetImage(
                            AppImg.india,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                            child: Text(
                          "India",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Change",
                              style: TextStyle(fontSize: 16),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Choose Verification Method",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 241, 241, 241),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          width: 40,
                          image: AssetImage(
                            AppImg.idCard,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                            child: Text(
                          "National Identity Card",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Checkbox(
                          value: isCecked1,
                          onChanged: (value) {
                            setState(() {
                              isCecked1 = value!;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 241, 241, 241),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          width: 40,
                          image: AssetImage(
                            AppImg.passport,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                            child: Text(
                          "Passport",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Checkbox(
                          value: isCecked1,
                          onChanged: (value) {
                            setState(() {
                              isCecked1 = value!;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Color.fromARGB(255, 241, 241, 241),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Image(
                          width: 40,
                          image: AssetImage(
                            AppImg.license,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Expanded(
                            child: Text(
                          "Driver License",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        )),
                        Checkbox(
                          value: isCecked1,
                          onChanged: (value) {
                            setState(() {
                              isCecked1 = value!;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: EdgeInsets.all(10),
          child: FullRounedButton(
              title: "Continue",
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraApp()));
              })),
    );
  }
}
