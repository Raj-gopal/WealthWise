// To parse this JSON data, do
//
//     final graphStockApi = graphStockApiFromJson(jsonString);

import 'dart:convert';

GraphStockApi graphStockApiFromJson(String str) => GraphStockApi.fromJson(json.decode(str));

String graphStockApiToJson(GraphStockApi data) => json.encode(data.toJson());

class GraphStockApi {
    String ticker;
    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    GraphStockApi({
        required this.ticker,
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    factory GraphStockApi.fromJson(Map<String, dynamic> json) => GraphStockApi(
        ticker: json["ticker"],
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "ticker": ticker,
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
    int v;
    double vw;
    double o;
    double c;
    double h;
    double l;
    int t;
    int n;

    Result({
        required this.v,
        required this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.t,
        required this.n,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        v: json["v"],
        vw: json["vw"]?.toDouble(),
        o: json["o"]?.toDouble(),
        c: json["c"]?.toDouble(),
        h: json["h"]?.toDouble(),
        l: json["l"]?.toDouble(),
        t: json["t"],
        n: json["n"],
    );

    Map<String, dynamic> toJson() => {
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": t,
        "n": n,
    };
}
