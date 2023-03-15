import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/setUp.dart/cameraApp.dart';

class ShowContry extends StatefulWidget {
  const ShowContry({super.key});

  @override
  State<ShowContry> createState() => _ShowContryState();
}

class _ShowContryState extends State<ShowContry> {
  bool isCecked1 = false;
  bool isCecked2 = false;
  bool isCecked3 = false;
  bool ifAnyCecked = false;
  @override
  ifAnyTrue() {
    if (isCecked1 || isCecked2 || isCecked3 == true) {
      setState(() {
        ifAnyCecked = true;
      });
    } else {
      setState(() {
        ifAnyCecked = false;
      });
    }
  }

  String contoryName = "India";
  String contoryImage = AppImg.india;

  List contory = [
    {
      "flage": AppImg.india,
      "name": "India",
    },
    {
      "flage": AppImg.US,
      "name": "United states",
    },
    {
      "flage": AppImg.UK,
      "name": "United Kingdom",
    },
    {
      "flage": AppImg.canada,
      "name": "Canada",
    },
    {
      "flage": AppImg.china,
      "name": "China",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        image: AssetImage(contoryImage),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        contoryName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ListView.builder(
                                    itemCount: contory.length,
                                    itemBuilder: (context, index) {
                                      return contoryName !=
                                              contory[index]["name"]
                                          ? Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 241, 241, 241),
                                                    )),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image(
                                                      width: 40,
                                                      image: AssetImage(
                                                        contory[index]["flage"],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      contory[index]["name"],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 10),
                                                      child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              contoryName =
                                                                  contory[index]
                                                                          [
                                                                          "name"]
                                                                      .toString();
                                                              print(
                                                                  "-------$contoryName");
                                                              contoryImage =
                                                                  contory[index]
                                                                          [
                                                                          "flage"]
                                                                      .toString();
                                                              print(
                                                                  "-------$contoryImage");
                                                            });
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            "Select",
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        36,
                                                                        107,
                                                                        253)),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : SizedBox.shrink();
                                    },
                                  );
                                });
                          },
                          child: const Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 36, 107, 253)),
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
                          if (isCecked2 || isCecked3 == true) {
                            setState(() {
                              isCecked2 = isCecked3 = false;
                            });
                          }
                          setState(() {
                            isCecked1 = value!;
                          });
                          ifAnyTrue();
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
                        value: isCecked2,
                        onChanged: (value) {
                          if (isCecked3 || isCecked1 == true) {
                            setState(() {
                              isCecked3 = isCecked1 = false;
                            });
                          }
                          setState(() {
                            isCecked2 = value!;
                          });
                          ifAnyTrue();
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
                        value: isCecked3,
                        onChanged: (value) {
                          if (isCecked1 || isCecked2 == true) {
                            setState(() {
                              isCecked1 = isCecked2 = false;
                            });
                          }
                          setState(() {
                            isCecked3 = value!;
                          });
                          ifAnyTrue();
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: EdgeInsets.all(10),
          child: ifAnyCecked == true
              ? FullRounedButton(
                  title: "Continue",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CameraApp()));
                  })
              : SizedBox.shrink()),
    );
  }
}
