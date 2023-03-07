import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:payza/class/img.dart';
import 'package:payza/customWidget/fullRounedButton.dart';
import 'package:payza/home.dart';
import 'package:payza/main.dart';
import 'package:payza/oneTimeScreen/loadingScreen.dart';
import 'package:payza/oneTimeScreen/loginScreen/loginHome.dart';
import 'package:payza/oneTimeScreen/loginScreen/cretaeAccount.dart';
import 'package:payza/oneTimeScreen/setUp.dart/resonPayza.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          print(value);
          setState(() {
            isLastPage = value == 2;
          });
        },
        controller: pageController,
        children: [
          OnBody(AppImg.introOne, "Now Easier to Make Online Pavments"),
          OnBody(AppImg.introTwo, "Secure Transactions & Reliable Anytime"),
          OnBody(AppImg.introThree, "Let's Manage Your Financials Statement!"),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: 150,
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 1),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SmoothPageIndicator(
                        effect: WormEffect(
                          dotHeight: 5,
                          dotWidth: 20,
                          activeDotColor: PrimaryColor,
                          dotColor: Color.fromARGB(255, 65, 65, 65),
                        ),
                        controller: pageController,
                        count: 3)),
                isLastPage == false
                    ? FullRounedButton(
                        title: "Next",
                        onPressed: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        })
                    : FullRounedButton(
                        title: "Get Start",
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          prefs.setBool('showHome', true);
                          final bool showHome;
                          showHome = prefs.getBool('showHome') ?? false;
                          print("---------$showHome");

                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CreateAccount(),
                              ),
                              (route) => false);
                        })
              ],
            )),
      ),
    );
  }

  Widget OnBody(String image, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: 350,
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
