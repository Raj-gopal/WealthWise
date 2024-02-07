import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wealthwise/screen/onboarding_page.dart';

class OnBoardingViewState extends StatefulWidget {
  const OnBoardingViewState({super.key});

  @override
  State<OnBoardingViewState> createState() => _OnBoardingViewStateState();
}

class _OnBoardingViewStateState extends State<OnBoardingViewState> {

  

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body : ListView(
        children: [
          PageView(
            children: [
              welcomefirstpage(s:s),
              welcomesecondpage(s:s),
              welcomethirdpage(s:s),

            ],
          )
        ],
      ),
    );
  }
}