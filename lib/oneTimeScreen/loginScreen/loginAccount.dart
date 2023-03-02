import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/appBar.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/oneTimeScreen/loginScreen/cretaeAccount.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => LoginAccountState();
}

class LoginAccountState extends State<LoginAccount> {
  bool isCecked = false;
  bool form1Color = false;
  bool form2Color = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const MyAppBar(),
            Image(image: AssetImage(AppImg.appLogo)),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Login to Your Account",
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
                    onTap: () {
                      setState(() {
                        form1Color = true;
                      });
                      setState(() {
                        form2Color = false;
                      });
                    },
                    decoration: InputDecoration(
                        hoverColor: Colors.red,
                        filled: true,
                        fillColor: form1Color == true
                            ? Color.fromARGB(255, 233, 239, 252)
                            : Color.fromARGB(255, 250, 250, 250),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(13),
                          width: 20,
                          height: 20,
                          child: Image.asset(AppImg.email),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 36, 107, 253),
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
                    onTap: () {
                      setState(() {
                        form1Color = false;
                      });
                      setState(() {
                        form2Color = true;
                      });
                    },
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: form2Color == true
                            ? Color.fromARGB(255, 233, 239, 252)
                            : Color.fromARGB(255, 250, 250, 250),
                        suffixIcon: IconButton(
                          icon: _passwordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        prefixIcon: Container(
                          padding: EdgeInsets.all(13),
                          width: 20,
                          height: 20,
                          child: Image.asset(AppImg.password),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 36, 107, 253),
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
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          splashRadius: 40,
                          value: isCecked,
                          onChanged: (value) {
                            setState(() {
                              isCecked = value!;
                            });
                          }),
                      Text(
                        "Remember me",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FullRounedButton(title: "Sing in", onPressed: () {}),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Color.fromARGB(255, 202, 202, 202),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Or continue with",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.7,
                          color: Color.fromARGB(255, 202, 202, 202),
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
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateAccount()));
                        },
                        child: const Text(
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
              )),
            ),
          ],
        ));
  }

  Widget buttonIcon(String image) {
    return Container(
      height: 70,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            foregroundColor: Color.fromARGB(255, 203, 203, 203),
            shadowColor: Color.fromARGB(255, 207, 207, 207),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Color.fromARGB(255, 231, 231, 231))),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 255, 255, 255)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
                height: 35,
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
