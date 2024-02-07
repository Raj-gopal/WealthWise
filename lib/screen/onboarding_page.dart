import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcomefirstpage extends StatelessWidget {
  const welcomefirstpage({super.key,required this.s });

  final Size s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 48),
        child: Center(
            child: Column(children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/image/Girl.png'),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Ease of investing',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 4,),
           Text(
            'All types of investments, one simple app',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
            ),
          ),
         
        ])),
      ),
    );
  }
}

class welcomesecondpage extends StatelessWidget {
  const welcomesecondpage({super.key,required this.s });

 final Size s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 48),
        child: Center(
            child: Column(children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/image/2nd.png'),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Securing Priorities',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 4,),
           Text(
            'Modernise your security with cutting-edge solutions',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
            ),
          ),
         
        ])),
      ),
    );
  }
}

class welcomethirdpage extends StatelessWidget {
  const welcomethirdpage({super.key,required this.s });

 final Size s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 48),
        child: Center(
            child: Column(children: [
          CircleAvatar(
            radius: 150,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/image/3rd.png'),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Smart Investing',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 4,),
           Text(
            'Access market updates anytime, anywhere',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
            ),
          ),
         
        ])),
      ),
    );
  }
}