import 'dart:convert';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wealthwise/model/Intraday.dart';
import 'package:wealthwise/model/company_name.dart';
import 'package:wealthwise/widgets/user_data.dart';

class graph_section extends StatefulWidget {
  graph_section({Key? key}) : super(key: key);

  @override
  State<graph_section> createState() => _graph_sectionState();
}

class _graph_sectionState extends State<graph_section> {
  List<GraphStockApi> graphstockApi = [];

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.results.length,
            itemBuilder: (context, index) {
              return Container(
                width: 32,
                height: 56,
                child: Sparkline(
                 data: [1,2,-6,-1,5],
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

  Future<GraphStockApi> getdata() async {
    final response = await http.get(Uri.parse(
        'https://api.polygon.io/v2/aggs/ticker/VNLA/range/1/minute/2023-01-11/2023-01-11?sort=desc&limit=10&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return GraphStockApi.fromJson(data);
    } else {
      return GraphStockApi.fromJson(data);
    }
  }
}
