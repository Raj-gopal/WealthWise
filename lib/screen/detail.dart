import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
=======
import 'package:fl_chart/fl_chart.dart';
>>>>>>> ca3f225e070225dafb34dc4d1a79197bc09480ff
import 'package:wealthwise/model/Intraday.dart';
import 'package:wealthwise/model/company_name.dart';

class stock_detail extends StatefulWidget {
  const stock_detail({super.key});

  @override
  State<stock_detail> createState() => _stock_detailState();
}

class _stock_detailState extends State<stock_detail> {
  Future<GraphStockApi> getdata() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/minute/2024-01-12/2024-01-12?sort=desc&limit=100&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GraphStockApi.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Text(
              'Stock',
              style: TextStyle(
                color: Color(0xFF041727),
                fontFamily: 'Montserrat',
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              width: 176,
            ),
            //search icon
            SizedBox(
              height: 24,
              width: 24,
              child: Image(
                image: AssetImage('assets/image/search 1.png'),
              ),
            ),
            SizedBox(
              width: 24,
            ),
            //profile icon
            SizedBox(
              height: 45,
              width: 45,
              child: Image(
                image: AssetImage('assets/image/man 1.png'),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: getdataname(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      height: 80,
                      width: 80,
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(3, 127, 255, 1),
                      ),
                    );
                  } else {
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.results[0].t.toString(),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(4, 23, 39, 1)),
                          ),
                          Text(
                            '＄' + snapshot.data!.results[0].vw.toString(),
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(4, 23, 39, 1)),
                          ),
                          RichText(
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: snapshot.data!.results[0].c -
                                              snapshot.data!.results[0].o >=
                                          0
                                      ? '+'
                                      : '',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: snapshot.data!.results[0].c -
                                                  snapshot.data!.results[0].o >=
                                              0
                                          ? Color.fromRGBO(18, 209, 142, 1)
                                          : Color.fromRGBO(209, 18, 18, 1)),
                                ),
                                TextSpan(
                                  text: (snapshot.data!.results[0].c -
                                          snapshot.data!.results[0].o)
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: snapshot.data!.results[0].c -
                                                  snapshot.data!.results[0].o >=
                                              0
                                          ? Color.fromRGBO(18, 209, 142, 1)
                                          : Color.fromRGBO(209, 18, 18, 1)),
                                ),
                                TextSpan(
                                  text: '%',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: snapshot.data!.results[0].c -
                                                  snapshot.data!.results[0].o >=
                                              0
                                          ? Color.fromRGBO(18, 209, 142, 1)
                                          : Color.fromRGBO(209, 18, 18, 1)),
                                ),
                                TextSpan(
                                  text: ' (1D)',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: snapshot.data!.results[0].c -
                                                  snapshot.data!.results[0].o >=
                                              0
                                          ? Color.fromRGBO(18, 209, 142, 1)
                                          : Color.fromRGBO(209, 18, 18, 1)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 24,
            ),
            Container(
<<<<<<< HEAD
                height: 292,
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
                          child: SfSparkLineChart(
                              data: sparklineData,
                              color: Color.fromRGBO(18, 209, 142, 1),
                              axisLineColor: Colors.transparent,
                              trackball: SparkChartTrackball(
                                  width: 1,
                                  backgroundColor: Colors.white,
                                  //  borderColor: Colors.black ,
                                  activationMode:
                                      SparkChartActivationMode.tap)),
                        );
                      }
                    }))
=======
              height: 292,
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
                        ),
                      );
                    } else {
                      // Extracting the VWAP (Volume Weighted Average Price) data
                      List<double> vwData = snapshot.data!.results
                          .map<double>((result) => result.vw.toDouble())
                          .toList();

                      // Extracting the corresponding x-axis values (timestamps)
                      List<double> timestamps = snapshot.data!.results
                          .map<double>((result) => result.t.toDouble())
                          .toList();

                      // Building the LineChart widget
                      return LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: const Color(0xff37434d),
                              width: 1,
                            ),
                          ),
                          minX: timestamps.first,
                          maxX: timestamps.last,
                          minY: vwData.reduce((value, element) => value < element ? value : element),
                          maxY: vwData.reduce((value, element) => value > element ? value : element),
                          lineBarsData: [
                            LineChartBarData(
                              spots: List.generate(
                                vwData.length,
                                (index) => FlSpot(timestamps[index], vwData[index]),
                              ),
                              isCurved: true,
                           //   colors: [const Color(0xff4af699)],
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
            ),
>>>>>>> ca3f225e070225dafb34dc4d1a79197bc09480ff
          ],
        ),
      ),
    );
  }

  Future<CompanyNameStockApi> getdataname() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/2023-01-11?adjusted=true&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return CompanyNameStockApi.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
