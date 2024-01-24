// To parse this JSON data, do
//
//     final timeSeriesIntraday = timeSeriesIntradayFromJson(jsonString);

import 'dart:convert';

TimeSeriesIntraday timeSeriesIntradayFromJson(String str) => TimeSeriesIntraday.fromJson(json.decode(str));

String timeSeriesIntradayToJson(TimeSeriesIntraday data) => json.encode(data.toJson());

class TimeSeriesIntraday {
    MetaData metaData;
    Map<String, TimeSeries1Min> timeSeries1Min;

    TimeSeriesIntraday({
        required this.metaData,
        required this.timeSeries1Min,
    });

    factory TimeSeriesIntraday.fromJson(Map<String, dynamic> json) => TimeSeriesIntraday(
        metaData: MetaData.fromJson(json["Meta Data"]),
        timeSeries1Min: Map.from(json["Time Series (1min)"]).map((k, v) => MapEntry<String, TimeSeries1Min>(k, TimeSeries1Min.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "Meta Data": metaData.toJson(),
        "Time Series (1min)": Map.from(timeSeries1Min).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class MetaData {
    String the1Information;
    String the2Symbol;
    DateTime the3LastRefreshed;
    String the4Interval;
    String the5OutputSize;
    String the6TimeZone;

    MetaData({
        required this.the1Information,
        required this.the2Symbol,
        required this.the3LastRefreshed,
        required this.the4Interval,
        required this.the5OutputSize,
        required this.the6TimeZone,
    });

    factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        the1Information: json["1. Information"],
        the2Symbol: json["2. Symbol"],
        the3LastRefreshed: DateTime.parse(json["3. Last Refreshed"]),
        the4Interval: json["4. Interval"],
        the5OutputSize: json["5. Output Size"],
        the6TimeZone: json["6. Time Zone"],
    );

    Map<String, dynamic> toJson() => {
        "1. Information": the1Information,
        "2. Symbol": the2Symbol,
        "3. Last Refreshed": the3LastRefreshed.toIso8601String(),
        "4. Interval": the4Interval,
        "5. Output Size": the5OutputSize,
        "6. Time Zone": the6TimeZone,
    };
}

class TimeSeries1Min {
    String the1Open;
    String the2High;
    String the3Low;
    String the4Close;
    String the5Volume;

    TimeSeries1Min({
        required this.the1Open,
        required this.the2High,
        required this.the3Low,
        required this.the4Close,
        required this.the5Volume,
    });

    factory TimeSeries1Min.fromJson(Map<String, dynamic> json) => TimeSeries1Min(
        the1Open: json["1. open"],
        the2High: json["2. high"],
        the3Low: json["3. low"],
        the4Close: json["4. close"],
        the5Volume: json["5. volume"],
    );

    Map<String, dynamic> toJson() => {
        "1. open": the1Open,
        "2. high": the2High,
        "3. low": the3Low,
        "4. close": the4Close,
        "5. volume": the5Volume,
    };
}
