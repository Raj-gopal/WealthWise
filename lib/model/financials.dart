import 'dart:convert';

class Financial {
  List<Result> results;
  String status;
  String requestId;
  String nextUrl;

  Financial({
    required this.results,
    required this.status,
    required this.requestId,
    required this.nextUrl,
  });

  factory Financial.fromJson(Map<String, dynamic> json) => Financial(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        nextUrl: json["next_url"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "next_url": nextUrl,
      };

  dynamic getValue(String key) {
    return results[0].getValue(key);
  }
}

class Result {
  String id;
  Financials financials;

  Result({
    required this.id,
    required this.financials,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        financials: Financials.fromJson(json["financials"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "financials": financials.toJson(),
      };

  dynamic getValue(String key) {
    return financials.getValue(key);
  }
}

class Financials {
  Map<String, BalanceSheet> balanceSheet;
  Map<String, BalanceSheet>? incomeStatement;
  CashFlowStatement? cashFlowStatement;
  ComprehensiveIncome? comprehensiveIncome;

  Financials({
    required this.balanceSheet,
    this.incomeStatement,
    this.cashFlowStatement,
    this.comprehensiveIncome,
  });

  factory Financials.fromJson(Map<String, dynamic> json) {
    return Financials(
      balanceSheet: Map<String, BalanceSheet>.from(
          json["balance_sheet"].map((k, v) =>
              MapEntry<String, BalanceSheet>(k, BalanceSheet.fromJson(v)))),
      incomeStatement: json["income_statement"] != null
          ? Map<String, BalanceSheet>.from(
              json["income_statement"]!.map((k, v) =>
                  MapEntry<String, BalanceSheet>(k, BalanceSheet.fromJson(v))))
          : null,
      cashFlowStatement: json["cash_flow_statement"] == null
          ? null
          : CashFlowStatement.fromJson(json["cash_flow_statement"]),
      comprehensiveIncome: json["comprehensive_income"] == null
          ? null
          : ComprehensiveIncome.fromJson(json["comprehensive_income"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "balance_sheet": mapToDynamic(balanceSheet),
        "income_statement": incomeStatement != null
            ? mapToDynamic(incomeStatement!)
            : null,
        "cash_flow_statement": cashFlowStatement?.toJson(),
        "comprehensive_income": comprehensiveIncome?.toJson(),
      };

  dynamic getValue(String key) {
    if (balanceSheet.containsKey(key)) {
      return balanceSheet[key]?.getValue(key);
    } else if (incomeStatement != null && incomeStatement!.containsKey(key)) {
      return incomeStatement![key]?.getValue(key);
    } else if (cashFlowStatement != null &&
        cashFlowStatement!.getValue(key) != null) {
      return cashFlowStatement!.getValue(key);
    } else if (comprehensiveIncome != null &&
        comprehensiveIncome!.getValue(key) != null) {
      return comprehensiveIncome!.getValue(key);
    } else {
      throw Exception("Key $key not found in Financials");
    }
  }

  Map<String, dynamic> mapToDynamic(Map<String, BalanceSheet> map) {
    return Map<String, dynamic>.from(map.map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));
  }
}

class BalanceSheet {
  double value;
  Unit unit;
  String label;
  int order;
  BalanceSheet? otherCurrentAssets;

  BalanceSheet({
    required this.value,
    required this.unit,
    required this.label,
    required this.order,
    this.otherCurrentAssets,
  });

  factory BalanceSheet.fromJson(Map<String, dynamic> json) {
    return BalanceSheet(
      value: json["value"]?.toDouble(),
      unit: unitValues.map[json["unit"]]!,
      label: json["label"],
      order: json["order"],
      otherCurrentAssets: json["other_current_assets"] != null
          ? BalanceSheet.fromJson(json["other_current_assets"])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
        "label": label,
        "order": order,
        "other_current_assets": otherCurrentAssets?.toJson(),
      };

  dynamic getValue(String key) {
    if (key == "other_current_assets" && otherCurrentAssets != null) {
      return otherCurrentAssets?.getValue(key);
    } else {
      return _getValueFromMap(key, toJson());
    }
  }

  dynamic _getValueFromMap(String key, Map<String, dynamic> map) {
    if (map.containsKey(key)) {
      return map[key];
    } else {
      throw Exception("Key $key not found in BalanceSheet");
    }
  }
}

class CashFlowStatement {
  BalanceSheet netCashFlow;

  CashFlowStatement({
    required this.netCashFlow,
  });

  factory CashFlowStatement.fromJson(Map<String, dynamic> json) => CashFlowStatement(
        netCashFlow: BalanceSheet.fromJson(json["net_cash_flow"]),
      );

  Map<String, dynamic> toJson() => {
        "net_cash_flow": netCashFlow.toJson(),
      };

  dynamic getValue(String key) {
    return netCashFlow.getValue(key);
  }
}

class ComprehensiveIncome {
  BalanceSheet comprehensiveIncomeLossAttributableToParent;

  ComprehensiveIncome({
    required this.comprehensiveIncomeLossAttributableToParent,
  });

  factory ComprehensiveIncome.fromJson(Map<String, dynamic> json) => ComprehensiveIncome(
        comprehensiveIncomeLossAttributableToParent:
            BalanceSheet.fromJson(json["comprehensive_income_loss_attributable_to_parent"]),
      );

  Map<String, dynamic> toJson() => {
        "comprehensive_income_loss_attributable_to_parent":
            comprehensiveIncomeLossAttributableToParent.toJson(),
      };

  dynamic getValue(String key) {
    return comprehensiveIncomeLossAttributableToParent.getValue(key);
  }
}

enum Unit {
  SHARES,
  USD,
  USD_SHARES
}

final unitValues = EnumValues({
  "shares": Unit.SHARES,
  "USD": Unit.USD,
  "USD / shares": Unit.USD_SHARES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

void main() {
  // Test your model classes here
  String jsonString = '{"results":[{"id":"exampleId","financials":{"balance_sheet":{"value":123.45,"unit":"USD","label":"exampleLabel","order":1,"other_current_assets":{"value":678.90,"unit":"USD","label":"Other Current Assets","order":2}}}}],"status":"success","request_id":"exampleRequestId","next_url":"exampleNextUrl"}';
  Financial financial = Financial.fromJson(json.decode(jsonString));
  print('Other Current Assets Value: ${financial.getValue("other_current_assets")}');
}
