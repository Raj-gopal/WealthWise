import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
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
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Color.fromRGBO(3, 127, 255, 1),
                ),
              );
            } else {
              var Data = snapshot.data!.results
                  .map<double>((result) => double.parse(result.vw.toString()))
                  .toList();

              return SfSparkLineChart(
                data: Data,
                color: Color.fromRGBO(18, 209, 142, 1),
                width: 1.2,
                axisLineColor: Colors.transparent,
                trackball: const SparkChartTrackball(
                  activationMode: SparkChartActivationMode.tap,
                  color: Color.fromRGBO(3, 127, 255, 1),
                  width: 1,
                  //backgroundColor: Color.fromRGBO(215, 233, 252, 1),
                ),
              );
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
