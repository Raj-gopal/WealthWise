import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FinancialData {
  final Map<String, dynamic> balanceSheet;

  FinancialData({required this.balanceSheet});

  factory FinancialData.fromJson(Map<String, dynamic> json) {
    return FinancialData(balanceSheet: json['financials']['balance_sheet']);
  }
}

class OverviewSection extends StatefulWidget {
  const OverviewSection({Key? key}) : super(key: key);

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  late Future<FinancialData> financialData;

  @override
  void initState() {
    super.initState();
    financialData = getFinancial();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fundamentals',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            FutureBuilder<FinancialData>(
              future: financialData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color.fromRGBO(3, 127, 255, 1),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: Text('No data available'),
                  );
                } else {
                  // Assuming 'other_current_assets' is directly under 'balance_sheet'
                  double otherCurrentAssetsValue =
                      snapshot.data!.balanceSheet['other_current_assets']['value'];
                  
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mkt Cap',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(166, 166, 166, 1),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Other Current Assets Value: $otherCurrentAssetsValue',
                      ),
                      // Add more widgets to display other financial data
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<FinancialData> getFinancial() async {
  final response = await http.get(
      Uri.parse('https://api.polygon.io/vX/reference/financials?ticker=AAPL&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    return FinancialData.fromJson(data['results'][0]);
  } else {
    throw Exception('Failed to load financial data');
  }
}
