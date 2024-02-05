import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class welcomefirstpage extends StatelessWidget {
  const welcomefirstpage({super.key});

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
            height: 96,
          ),
          Text(
            'Ease of investing',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
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
