import 'dart:convert';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wealthwise/model/Intraday.dart';
import 'package:wealthwise/widgets/user_data.dart';

class graph_section extends StatefulWidget {
  graph_section({Key? key}) : super(key: key);

  @override
  State<graph_section> createState() => _graph_sectionState();
}

class _graph_sectionState extends State<graph_section> {
  List<StockApi> stockApi = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StockApi>>(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Container(
                width: 32,
                height: 56,
                child: Sparkline(
                  data: [double.parse(snapshot.data![index].close)],
                  lineWidth: 1.5,
                  lineColor: Color.fromRGBO(18, 209, 142, 1),
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(152, 243, 150, 1), Colors.white],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<StockApi>> getdata() async {
    final response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['Time Series (5min)']
          as Map<String, dynamic>;

      List<StockApi> stockApiList = [];

      data.forEach((key, value) {
        stockApiList.add(StockApi.fromJson(value as Map<String, dynamic>));
      });

      return stockApiList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
