import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/customWidget/appBar.dart';

class ResonPayza extends StatefulWidget {
  const ResonPayza({super.key});

  @override
  State<ResonPayza> createState() => _ResonPayzaState();
}

class _ResonPayzaState extends State<ResonPayza> {
  bool isCecked1 = false;
  bool isCecked2 = false;
  bool isCecked3 = false;
  bool isCecked4 = true;
  bool isCecked5 = false;
  bool isCecked6 = false;
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
                  costomBox(isCecked1, "Mack Online Payments"),
                  costomBox(isCecked2, "Spend or save daily"),
                  costomBox(isCecked3, "Gain exposure to financial assets"),
                  costomBox(isCecked4, "Send and manage money"),
                  costomBox(isCecked5, "Spend while travelling"),
                  costomBox(isCecked6, "Others reason"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget costomBox(bool checkbox, String title) {
    return Container(
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
              value: checkbox,
              onChanged: (value) {
                print(checkbox);
                setState(() {
                  checkbox = value!;
                });
                print(checkbox);
              }),
          Expanded(
              child: Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ))
        ],
      ),
    );
  }
}
