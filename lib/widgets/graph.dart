import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class graph_section extends StatefulWidget {
  const graph_section({super.key});

  @override
  State<graph_section> createState() => _graph_sectionState();
}

class _graph_sectionState extends State<graph_section> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 32,
        height: 56,
        child: Sparkline(
          data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
          lineWidth: 1.5,
          lineColor: Color.fromRGBO(18, 209, 142, 1),
          fillMode: FillMode.below,
          fillGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(152, 243, 150, 1),
              Colors.white
            ],
          ),
        ));
  }
}
