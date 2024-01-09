// To parse this JSON data, do
//
//     final companyNameStockApi = companyNameStockApiFromJson(jsonString);

import 'dart:convert';

List<CompanyNameStockApi> companyNameStockApiFromJson(String str) => List<CompanyNameStockApi>.from(json.decode(str).map((x) => CompanyNameStockApi.fromJson(x)));

String companyNameStockApiToJson(List<CompanyNameStockApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyNameStockApi {
    String symbol;
    String name;
    String? currency;
    String stockExchange;
    String exchangeShortName;

    CompanyNameStockApi({
        required this.symbol,
        required this.name,
        required this.currency,
        required this.stockExchange,
        required this.exchangeShortName,
    });

    factory CompanyNameStockApi.fromJson(Map<String, dynamic> json) => CompanyNameStockApi(
        symbol: json["symbol"],
        name: json["name"],
        currency: json["currency"],
        stockExchange: json["stockExchange"],
        exchangeShortName: json["exchangeShortName"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "name": name,
        "currency": currency,
        "stockExchange": stockExchange,
        "exchangeShortName": exchangeShortName,
    };
}
