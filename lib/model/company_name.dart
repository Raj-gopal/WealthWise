// To parse this JSON data, do
//
//     final companyNameStockApi = companyNameStockApiFromJson(jsonString);

import 'dart:convert';

CompanyNameStockApi companyNameStockApiFromJson(String str) => CompanyNameStockApi.fromJson(json.decode(str));

String companyNameStockApiToJson(CompanyNameStockApi data) => json.encode(data.toJson());

class CompanyNameStockApi {
    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    CompanyNameStockApi({
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    factory CompanyNameStockApi.fromJson(Map<String, dynamic> json) => CompanyNameStockApi(
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
    };
}

class Result {
    String t;
    double v;
    double? vw;
    double o;
    double c;
    double h;
    double l;
    int resultT;
    int? n;

    Result({
        required this.t,
        required this.v,
        this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.resultT,
        this.n,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        t: json["T"],
        v: json["v"]?.toDouble(),
        vw: json["vw"]?.toDouble(),
        o: json["o"]?.toDouble(),
        c: json["c"]?.toDouble(),
        h: json["h"]?.toDouble(),
        l: json["l"]?.toDouble(),
        resultT: json["t"],
        n: json["n"],
    );

    Map<String, dynamic> toJson() => {
        "T": t,
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": resultT,
        "n": n,
    };
}
