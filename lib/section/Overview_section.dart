import 'package:flutter/material.dart';

class Overview_section extends StatefulWidget {
  const Overview_section({super.key});

  @override
  State<Overview_section> createState() => _Overview_sectionState();
}

class _Overview_sectionState extends State<Overview_section> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fundamentals',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(child: Column(children: [Row(children: [Text('Mkt Cap'),Text('₹8454Cr')],)],),),
                Container(height: 80,color: Colors.blue,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
