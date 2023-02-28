import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => CreateAccountState();
}

class CreateAccountState extends State<CreateAccount> {
  bool isCecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const MyAppBar(),
        Image(image: AssetImage(AppImg.appLogo)),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Create New Account",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    focusColor: Colors.red,
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 231, 231),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(13),
                      height: 50,
                      width: 50,
                      child: Image.asset(AppImg.email),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 77, 103, 249),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(color: Colors.transparent),
                    ),
                    hintText: " Email ID"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    focusColor: Colors.red,
                    filled: true,
                    fillColor: Color.fromARGB(255, 231, 231, 231),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(13),
                      height: 50,
                      width: 50,
                      child: Image.asset(AppImg.password),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 77, 103, 249),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: new BorderSide(color: Colors.transparent),
                    ),
                    hintText: " Password"),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      // shape: CircleBorder(),
                      value: isCecked,
                      onChanged: (value) {
                        setState(() {
                          isCecked = value!;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FullRounedButton(title: "Sing in", onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              const InkWell(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color.fromARGB(255, 36, 107, 253)),
                ),
              ),
              SizedBox(
                height: 15,
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonIcon(AppImg.facebook),
                  buttonIcon(AppImg.google),
                  buttonIcon(AppImg.apple),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an accounf ?",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateAccount()));
                    },
                    child: Text(
                      "Sing in",
                      style: TextStyle(
                          color: Color.fromARGB(255, 7, 114, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      ],
    ));
  }

  Widget buttonIcon(String image) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(255, 220, 220, 220))),
      child: Image(
        image: AssetImage(image),
        height: 40,
      ),
    );
  }
}
