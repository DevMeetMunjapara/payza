import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/setUp.dart/verifyID.dart';

class ResonPayza extends StatefulWidget {
  const ResonPayza({super.key});

  @override
  State<ResonPayza> createState() => _ResonPayzaState();
}

class _ResonPayzaState extends State<ResonPayza> {
  bool isCecked1 = false;
  bool isCecked2 = false;
  bool isCecked3 = false;
  bool isCecked4 = false;
  bool isCecked5 = false;
  bool isCecked6 = false;
  bool ifAnyCecked = false;

  ifAnyTrue() {
    if (isCecked1 ||
        isCecked2 ||
        isCecked3 ||
        isCecked4 ||
        isCecked5 ||
        isCecked6 == true) {
      setState(() {
        ifAnyCecked = true;
      });
    } else {
      setState(() {
        ifAnyCecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppBar(),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 17, right: 17),
              child: Column(
                children: [
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
                  costomBox()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: ifAnyCecked == true
              ? FullRounedButton(
                  title: "Continue",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VerifyID()));
                  })
              : Text("")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget costomBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked1,
                  onChanged: (value) {
                    setState(() {
                      isCecked1 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Mack Online Payments",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked2,
                  onChanged: (value) {
                    setState(() {
                      isCecked2 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Spend or save daily",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked3,
                  onChanged: (value) {
                    setState(() {
                      isCecked3 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Gain exposure to financial assets",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked4,
                  onChanged: (value) {
                    setState(() {
                      isCecked4 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Send and manage money",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked5,
                  onChanged: (value) {
                    setState(() {
                      isCecked5 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Spend while travelling",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 252, 252),
              border: Border.all(color: Color.fromARGB(255, 234, 234, 234)),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  splashRadius: 40,
                  value: isCecked6,
                  onChanged: (value) {
                    setState(() {
                      isCecked6 = value!;
                      ifAnyTrue();
                    });
                  }),
              Expanded(
                  child: Text(
                "Others reason",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
