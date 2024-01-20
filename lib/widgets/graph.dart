import 'dart:convert';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:wealthwise/model/Intraday.dart';

class CandlestickGraph extends StatefulWidget {
  const CandlestickGraph({Key? key}) : super(key: key);

  @override
  _CandlestickGraphState createState() => _CandlestickGraphState();
}

class _CandlestickGraphState extends State<CandlestickGraph> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
                    future: getdata(),
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
                    }),
    );
    
  }

    Future<GraphStockApi> getdata() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/minute/2024-01-12/2024-01-12?sort=desc&limit=50&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GraphStockApi.fromJson(data);
    } else {
      return GraphStockApi.fromJson(data);
    }
  }
  }
