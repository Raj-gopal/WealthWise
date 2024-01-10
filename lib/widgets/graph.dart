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
     List<CompanyNameStockApi>  companyName = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getname(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: companyName.length,
            itemBuilder: (context, index) {
              return Container(
                width: 32,
                height: 56,
                child: Sparkline(
                  data: [0,1,2,-7,4,5,6,-1,4,-3],
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


  Future<List<CompanyNameStockApi>> getname() async{

   final response = await http.get(Uri.parse('https://financialmodelingprep.com/api/v3/search?query=AA&apikey=T7P7eb7IvqOle9pHS0dnSx7mht424blu'));
   var data = jsonDecode(response.body.toString());

   if (response.statusCode==200) {
     for (Map<String, dynamic> i in data) {
       companyName.add(CompanyNameStockApi.fromJson(i));
     }
     return companyName;
   } else {
     return companyName;
   }
  }
  
  }

