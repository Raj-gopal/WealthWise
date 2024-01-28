// To parse this JSON data, do
//
//     final financial = financialFromJson(jsonString);

import 'dart:convert';

Financial financialFromJson(String str) => Financial.fromJson(json.decode(str));

String financialToJson(Financial data) => json.encode(data.toJson());

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
}

class Result {
    String id;
    DateTime startDate;
    DateTime endDate;
    Timeframe timeframe;
    String fiscalPeriod;
    String fiscalYear;
    String cik;
    String sic;
    List<Ticker> tickers;
    CompanyName companyName;
    Financials financials;
    DateTime? filingDate;
    DateTime? acceptanceDatetime;
    String? sourceFilingUrl;
    String? sourceFilingFileUrl;

    Result({
        required this.id,
        required this.startDate,
        required this.endDate,
        required this.timeframe,
        required this.fiscalPeriod,
        required this.fiscalYear,
        required this.cik,
        required this.sic,
        required this.tickers,
        required this.companyName,
        required this.financials,
        this.filingDate,
        this.acceptanceDatetime,
        this.sourceFilingUrl,
        this.sourceFilingFileUrl,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        timeframe: timeframeValues.map[json["timeframe"]]!,
        fiscalPeriod: json["fiscal_period"],
        fiscalYear: json["fiscal_year"],
        cik: json["cik"],
        sic: json["sic"],
        tickers: List<Ticker>.from(json["tickers"].map((x) => tickerValues.map[x]!)),
        companyName: companyNameValues.map[json["company_name"]]!,
        financials: Financials.fromJson(json["financials"]),
        filingDate: json["filing_date"] == null ? null : DateTime.parse(json["filing_date"]),
        acceptanceDatetime: json["acceptance_datetime"] == null ? null : DateTime.parse(json["acceptance_datetime"]),
        sourceFilingUrl: json["source_filing_url"],
        sourceFilingFileUrl: json["source_filing_file_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "timeframe": timeframeValues.reverse[timeframe],
        "fiscal_period": fiscalPeriod,
        "fiscal_year": fiscalYear,
        "cik": cik,
        "sic": sic,
        "tickers": List<dynamic>.from(tickers.map((x) => tickerValues.reverse[x])),
        "company_name": companyNameValues.reverse[companyName],
        "financials": financials.toJson(),
        "filing_date": "${filingDate!.year.toString().padLeft(4, '0')}-${filingDate!.month.toString().padLeft(2, '0')}-${filingDate!.day.toString().padLeft(2, '0')}",
        "acceptance_datetime": acceptanceDatetime?.toIso8601String(),
        "source_filing_url": sourceFilingUrl,
        "source_filing_file_url": sourceFilingFileUrl,
    };
}

enum CompanyName {
    APPLE_INC,
    COMPANY_NAME_APPLE_INC
}

final companyNameValues = EnumValues({
    "APPLE INC": CompanyName.APPLE_INC,
    "Apple Inc.": CompanyName.COMPANY_NAME_APPLE_INC
});

class Financials {
    Map<String, BalanceSheet> balanceSheet;
    CashFlowStatement? cashFlowStatement;
    ComprehensiveIncome? comprehensiveIncome;
    Map<String, BalanceSheet>? incomeStatement;

    Financials({
        required this.balanceSheet,
        this.cashFlowStatement,
        this.comprehensiveIncome,
        this.incomeStatement,
    });

    factory Financials.fromJson(Map<String, dynamic> json) => Financials(
        balanceSheet: Map.from(json["balance_sheet"]).map((k, v) => MapEntry<String, BalanceSheet>(k, BalanceSheet.fromJson(v))),
        cashFlowStatement: json["cash_flow_statement"] == null ? null : CashFlowStatement.fromJson(json["cash_flow_statement"]),
        comprehensiveIncome: json["comprehensive_income"] == null ? null : ComprehensiveIncome.fromJson(json["comprehensive_income"]),
        incomeStatement: Map.from(json["income_statement"]!).map((k, v) => MapEntry<String, BalanceSheet>(k, BalanceSheet.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "balance_sheet": Map.from(balanceSheet).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "cash_flow_statement": cashFlowStatement?.toJson(),
        "comprehensive_income": comprehensiveIncome?.toJson(),
        "income_statement": Map.from(incomeStatement!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class BalanceSheet {
    double value;
    Unit unit;
    String label;
    int order;

    BalanceSheet({
        required this.value,
        required this.unit,
        required this.label,
        required this.order,
    });

    factory BalanceSheet.fromJson(Map<String, dynamic> json) => BalanceSheet(
        value: json["value"]?.toDouble(),
        unit: unitValues.map[json["unit"]]!,
        label: json["label"],
        order: json["order"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "unit": unitValues.reverse[unit],
        "label": label,
        "order": order,
    };
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

class CashFlowStatement {
    BalanceSheet netCashFlowFromOperatingActivities;
    BalanceSheet netCashFlowFromOperatingActivitiesContinuing;
    BalanceSheet netCashFlowFromFinancingActivities;
    BalanceSheet netCashFlowContinuing;
    BalanceSheet netCashFlowFromInvestingActivitiesContinuing;
    BalanceSheet netCashFlow;
    BalanceSheet netCashFlowFromInvestingActivities;
    BalanceSheet netCashFlowFromFinancingActivitiesContinuing;

    CashFlowStatement({
        required this.netCashFlowFromOperatingActivities,
        required this.netCashFlowFromOperatingActivitiesContinuing,
        required this.netCashFlowFromFinancingActivities,
        required this.netCashFlowContinuing,
        required this.netCashFlowFromInvestingActivitiesContinuing,
        required this.netCashFlow,
        required this.netCashFlowFromInvestingActivities,
        required this.netCashFlowFromFinancingActivitiesContinuing,
    });

    factory CashFlowStatement.fromJson(Map<String, dynamic> json) => CashFlowStatement(
        netCashFlowFromOperatingActivities: BalanceSheet.fromJson(json["net_cash_flow_from_operating_activities"]),
        netCashFlowFromOperatingActivitiesContinuing: BalanceSheet.fromJson(json["net_cash_flow_from_operating_activities_continuing"]),
        netCashFlowFromFinancingActivities: BalanceSheet.fromJson(json["net_cash_flow_from_financing_activities"]),
        netCashFlowContinuing: BalanceSheet.fromJson(json["net_cash_flow_continuing"]),
        netCashFlowFromInvestingActivitiesContinuing: BalanceSheet.fromJson(json["net_cash_flow_from_investing_activities_continuing"]),
        netCashFlow: BalanceSheet.fromJson(json["net_cash_flow"]),
        netCashFlowFromInvestingActivities: BalanceSheet.fromJson(json["net_cash_flow_from_investing_activities"]),
        netCashFlowFromFinancingActivitiesContinuing: BalanceSheet.fromJson(json["net_cash_flow_from_financing_activities_continuing"]),
    );

    Map<String, dynamic> toJson() => {
        "net_cash_flow_from_operating_activities": netCashFlowFromOperatingActivities.toJson(),
        "net_cash_flow_from_operating_activities_continuing": netCashFlowFromOperatingActivitiesContinuing.toJson(),
        "net_cash_flow_from_financing_activities": netCashFlowFromFinancingActivities.toJson(),
        "net_cash_flow_continuing": netCashFlowContinuing.toJson(),
        "net_cash_flow_from_investing_activities_continuing": netCashFlowFromInvestingActivitiesContinuing.toJson(),
        "net_cash_flow": netCashFlow.toJson(),
        "net_cash_flow_from_investing_activities": netCashFlowFromInvestingActivities.toJson(),
        "net_cash_flow_from_financing_activities_continuing": netCashFlowFromFinancingActivitiesContinuing.toJson(),
    };
}

class ComprehensiveIncome {
    BalanceSheet comprehensiveIncomeLossAttributableToNoncontrollingInterest;
    BalanceSheet comprehensiveIncomeLoss;
    BalanceSheet otherComprehensiveIncomeLossAttributableToParent;
    BalanceSheet comprehensiveIncomeLossAttributableToParent;
    BalanceSheet otherComprehensiveIncomeLoss;

    ComprehensiveIncome({
        required this.comprehensiveIncomeLossAttributableToNoncontrollingInterest,
        required this.comprehensiveIncomeLoss,
        required this.otherComprehensiveIncomeLossAttributableToParent,
        required this.comprehensiveIncomeLossAttributableToParent,
        required this.otherComprehensiveIncomeLoss,
    });

    factory ComprehensiveIncome.fromJson(Map<String, dynamic> json) => ComprehensiveIncome(
        comprehensiveIncomeLossAttributableToNoncontrollingInterest: BalanceSheet.fromJson(json["comprehensive_income_loss_attributable_to_noncontrolling_interest"]),
        comprehensiveIncomeLoss: BalanceSheet.fromJson(json["comprehensive_income_loss"]),
        otherComprehensiveIncomeLossAttributableToParent: BalanceSheet.fromJson(json["other_comprehensive_income_loss_attributable_to_parent"]),
        comprehensiveIncomeLossAttributableToParent: BalanceSheet.fromJson(json["comprehensive_income_loss_attributable_to_parent"]),
        otherComprehensiveIncomeLoss: BalanceSheet.fromJson(json["other_comprehensive_income_loss"]),
    );

    Map<String, dynamic> toJson() => {
        "comprehensive_income_loss_attributable_to_noncontrolling_interest": comprehensiveIncomeLossAttributableToNoncontrollingInterest.toJson(),
        "comprehensive_income_loss": comprehensiveIncomeLoss.toJson(),
        "other_comprehensive_income_loss_attributable_to_parent": otherComprehensiveIncomeLossAttributableToParent.toJson(),
        "comprehensive_income_loss_attributable_to_parent": comprehensiveIncomeLossAttributableToParent.toJson(),
        "other_comprehensive_income_loss": otherComprehensiveIncomeLoss.toJson(),
    };
}

enum Ticker {
    AAPL
}

final tickerValues = EnumValues({
    "AAPL": Ticker.AAPL
});

enum Timeframe {
    ANNUAL,
    QUARTERLY,
    TTM
}

final timeframeValues = EnumValues({
    "annual": Timeframe.ANNUAL,
    "quarterly": Timeframe.QUARTERLY,
    "ttm": Timeframe.TTM
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
