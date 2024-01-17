import 'dart:convert';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wealthwise/model/Intraday.dart';

class candelstickgraph extends StatefulWidget {
  const candelstickgraph({super.key});

  @override
  State<candelstickgraph> createState() => _candelstickgraphState();
}

class _candelstickgraphState extends State<candelstickgraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 292,
       
      child: Column(

        children: [
          FutureBuilder(
                    future: getdataname(),
                    builder: (context, AsyncSnapshot<GraphStockApi> snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            child: CircularProgressIndicator(
                              color: Color.fromRGBO(3, 127, 255, 1),
                            ));
                      } else {
                        var sparklineData = snapshot.data!.results
                            .map<double>(
                                (result) => double.parse(result.vw.toString()))
                            .toList();

                        return Container(
                            child: Sparkline(
                          data: sparklineData,
                          lineWidth: 2,
                          lineColor: Color.fromRGBO(18, 209, 142, 1),
                          fillMode: FillMode.below,
                          fillGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromRGBO(18, 209, 142, 1),
                              Colors.white10
                            ],
                          ),
                          averageLine: true,
                          averageLabel: true,
                        ));
                      }
                    })
        ],
   
      ),

    );
  }

 Future<GraphStockApi> getdataname() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/minute/2023-01-12/2023-01-12?sort=desc&limit=50&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKqq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GraphStockApi.fromJson(data);
    } else {
      return GraphStockApi.fromJson(data);
    }
  }
}