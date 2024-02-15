import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wealthwise/screen/sign_in_page.dart';

class onboarding_Screen extends StatelessWidget {
  onboarding_Screen({super.key});

  List<PageViewModel> pages = [
    PageViewModel(
      title: 'Ease of investing',
      body: 'All types of investments, one simple app',
      image: CircleAvatar(
        radius: 150,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/image/Girl.png'),
      ),
      decoration: PageDecoration(
        pageColor: Colors.white,
        imageFlex: 2,
        bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
        titlePadding: EdgeInsets.only(top: 40),
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey),
      ),
    ),
    PageViewModel(
      title: 'Securing Priorities',
      body: 'Upgrade security with latest solutions',
      image: CircleAvatar(
        radius: 150,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/image/2nd.png'),
      ),
      decoration: PageDecoration(
        pageColor: Colors.white,
        imageFlex: 2,
        bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
        titlePadding: EdgeInsets.only(top: 40),
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey),
      ),
    ),
    PageViewModel(
      title: 'Smart Investing',
      body: 'Access market updates anytime, anywhere',
      image: CircleAvatar(
        radius: 150,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage('assets/image/3rd.png'),
      ),
      decoration: PageDecoration(
        pageColor: Colors.white,
        imageFlex: 2,
        bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
        titlePadding: EdgeInsets.only(top: 40),
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        bodyTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        showNextButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(166, 166, 166, 1),
          ),
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF037FFF),
          ),
        ),
        next: const Text(
          'Next',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF037FFF),
          ),
        ),
        onDone: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        },
        skipOrBackFlex: 0,
        nextFlex: 0,
        scrollPhysics: NeverScrollableScrollPhysics(),
        curve: Curves.ease,
        controlsMargin: const EdgeInsets.all(16),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color.fromRGBO(233, 233, 233, 1),
          activeColor: Color(0xFF037FFF),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
