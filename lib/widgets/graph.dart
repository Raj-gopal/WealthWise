import 'dart:convert';
import 'dart:async';
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
  late StreamController<List<double>> _dataStreamController;
  late List<double> _data;

  @override
  void initState() {
    super.initState();
    _dataStreamController = StreamController<List<double>>();
    _data = [];
    // Start fetching data when the widget is initialized
    _startFetchingData();
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  void _startFetchingData() {
    // Fetch data at regular intervals using a Timer
    Timer.periodic(Duration(seconds: 10), (Timer timer) async {
      List<double> newData = await getData();
      // Add the new data to the stream
      _dataStreamController.add(newData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<double>>(
        stream: _dataStreamController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                color: Color.fromRGBO(3, 127, 255, 1),
              ),
            );
          } else {
            _data = snapshot.data!;
            return SfSparkLineChart(
              data: _data,
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
        },
      ),
    );
  }

  Future<List<double>> getData() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/minute/2024-01-12/2024-01-12?sort=desc&limit=50&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GraphStockApi.fromJson(data).results
          .map<double>((result) => double.parse(result.vw.toString()))
          .toList();
    } else {
      // Handle error case
      return [];
    }
  }
}
