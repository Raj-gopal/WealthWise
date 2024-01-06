import 'package:flutter/material.dart';
import 'package:wealthwise/widgets/graph.dart';

class Explore_section extends StatefulWidget {
  const Explore_section({super.key});

  @override
  State<Explore_section> createState() => _Explore_sectionState();
}

class _Explore_sectionState extends State<Explore_section> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    'ITC',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(4, 23, 39, 1)),
                  ),
                  SizedBox(
                    width: 128,
                  ),
                 graph_section(),
                  SizedBox(
                    width: 56,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹455.20',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(4, 23, 39, 1)),
                      ),
                      Text(
                        '+3.75(0.83%)',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(18, 209, 142, 1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
