import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wealthwise/model/About_company.dart';

class FinancialData {
  final Map<String, dynamic> balanceSheet;

  FinancialData({required this.balanceSheet});

  factory FinancialData.fromJson(Map<String, dynamic> json) {
    return FinancialData(balanceSheet: json['financials']['balance_sheet']);
  }
}

class ItemWidget extends StatelessWidget {
  final String label;
  final String value;

  ItemWidget({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(166, 166, 166, 1),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(4, 23, 39, 1),
          ),
        ),
      ],
    );
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            'Fundamentals',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
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
                // Assuming other_current_assets
                double otherCurrentAssetsValue =
                    snapshot.data!.balanceSheet['assets']['value'] * 0.00000001;
                String formattedValue =
                    otherCurrentAssetsValue.toStringAsFixed(2);

                // Assuming Equity
                double Equity =
                    snapshot.data!.balanceSheet['equity']['value'] * 0.00000001;
                String EquityValue = Equity.toStringAsFixed(2);

                // Assuming equitytonci
                double equitytonci = snapshot.data!.balanceSheet[
                            'equity_attributable_to_noncontrolling_interest']
                        ['value'] *
                    0.00000001;
                String equitytonciValue = equitytonci.toStringAsFixed(2);

                // Assuming inventory
                double inventory = snapshot.data!.balanceSheet['inventory']
                        ['value'] *
                    0.00000001;
                String inventoryValue = inventory.toStringAsFixed(2);

                // Assuming current_assets
                double current_assets =
                    snapshot.data!.balanceSheet['current_assets']['value'] *
                        0.00000001;
                String current_assetsValue = current_assets.toStringAsFixed(2);

                // Assuming current_assets
                double long_term_debt =
                    snapshot.data!.balanceSheet['long_term_debt']['value'] *
                        0.00000001;
                String long_term_debtValue = long_term_debt.toStringAsFixed(2);

                // Assuming liabilities_and_equity
                double liabilities_and_equity = snapshot
                        .data!.balanceSheet['liabilities_and_equity']['value'] *
                    0.00000001;
                String liabilities_and_equityValue =
                    liabilities_and_equity.toStringAsFixed(2);

                // Assuming fixed_assets
                double fixed_assets =
                    snapshot.data!.balanceSheet['fixed_assets']['value'] *
                        0.00000001;
                String fixed_assetsValue = fixed_assets.toStringAsFixed(2);

                return Column(
                  children: [
                    // Assuming other_current_assets
                    ItemWidget(
                      label: 'Assets',
                      value: formattedValue + ' B',
                    ),
                    // Assuming Equity
                    ItemWidget(
                      label: 'Equity to NCI',
                      value: equitytonciValue + ' B',
                    ),
                    // Assuming other_current_assets
                    ItemWidget(
                      label: 'Inventory',
                      value: inventoryValue + ' B',
                    ),
                    // Assuming Equity
                    ItemWidget(
                      label: 'Current Assets',
                      value: current_assetsValue + ' B',
                    ),
                    // Assuming other_current_assets
                    ItemWidget(
                      label: 'Long Term Debt',
                      value: long_term_debtValue + ' B',
                    ),
                    // Assuming Equity
                    ItemWidget(
                      label: 'Liabilities and Equity',
                      value: liabilities_and_equityValue + ' B',
                    ),
                    // Assuming other_current_assets
                    ItemWidget(
                      label: 'Fixed Assets',
                      value: fixed_assetsValue + ' B',
                    ),
                  ],
                );
              }
            },
          ),
          SizedBox(height: 16),
          Text(
            'About company',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          FutureBuilder(
              future: getAboutCompany(),
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
                  return Text(snapshot.data!.results.name.toString());
                }
              })
        ],
      ),
    );
  }
}

Future<FinancialData> getFinancial() async {
  final response = await http.get(Uri.parse(
      'https://api.polygon.io/vX/reference/financials?ticker=AAPL&apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    return FinancialData.fromJson(data['results'][0]);
  } else {
    throw Exception('Failed to load financial data');
  }
}

void main() {
  runApp(MaterialApp(
    home: OverviewSection(),
  ));
}

Future<AboutCompany> getAboutCompany() async {
  final response = await http.get(Uri.parse(
      'https://api.polygon.io/v3/reference/tickers/AAPL?apiKey=h8gjI2GQTJ1KibD7oZXacUGOhTS5qKKq'));

   var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    //Map<String, dynamic> data = jsonDecode(response.body.toString());
    return AboutCompany.fromJson(data);
  } else {
    throw Exception('Failed to load financial data');
  }
}
