// To parse this JSON data, do
//
//     final aboutCompany = aboutCompanyFromJson(jsonString);

import 'dart:convert';

AboutCompany aboutCompanyFromJson(String str) => AboutCompany.fromJson(json.decode(str));

String aboutCompanyToJson(AboutCompany data) => json.encode(data.toJson());

class AboutCompany {
    String requestId;
    Results results;
    String status;

    AboutCompany({
        required this.requestId,
        required this.results,
        required this.status,
    });

    factory AboutCompany.fromJson(Map<String, dynamic> json) => AboutCompany(
        requestId: json["request_id"],
        results: Results.fromJson(json["results"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "results": results.toJson(),
        "status": status,
    };
}

class Results {
    String ticker;
    String name;
    String market;
    String locale;
    String primaryExchange;
    String type;
    bool active;
    String currencyName;
    String cik;
    String compositeFigi;
    String shareClassFigi;
    int marketCap;
    String phoneNumber;
    Address address;
    String description;
    String sicCode;
    String sicDescription;
    String tickerRoot;
    String homepageUrl;
    int totalEmployees;
    DateTime listDate;
    Branding branding;
    int shareClassSharesOutstanding;
    int weightedSharesOutstanding;
    int roundLot;

    Results({
        required this.ticker,
        required this.name,
        required this.market,
        required this.locale,
        required this.primaryExchange,
        required this.type,
        required this.active,
        required this.currencyName,
        required this.cik,
        required this.compositeFigi,
        required this.shareClassFigi,
        required this.marketCap,
        required this.phoneNumber,
        required this.address,
        required this.description,
        required this.sicCode,
        required this.sicDescription,
        required this.tickerRoot,
        required this.homepageUrl,
        required this.totalEmployees,
        required this.listDate,
        required this.branding,
        required this.shareClassSharesOutstanding,
        required this.weightedSharesOutstanding,
        required this.roundLot,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        ticker: json["ticker"],
        name: json["name"],
        market: json["market"],
        locale: json["locale"],
        primaryExchange: json["primary_exchange"],
        type: json["type"],
        active: json["active"],
        currencyName: json["currency_name"],
        cik: json["cik"],
        compositeFigi: json["composite_figi"],
        shareClassFigi: json["share_class_figi"],
        marketCap: json["market_cap"],
        phoneNumber: json["phone_number"],
        address: Address.fromJson(json["address"]),
        description: json["description"],
        sicCode: json["sic_code"],
        sicDescription: json["sic_description"],
        tickerRoot: json["ticker_root"],
        homepageUrl: json["homepage_url"],
        totalEmployees: json["total_employees"],
        listDate: DateTime.parse(json["list_date"]),
        branding: Branding.fromJson(json["branding"]),
        shareClassSharesOutstanding: json["share_class_shares_outstanding"],
        weightedSharesOutstanding: json["weighted_shares_outstanding"],
        roundLot: json["round_lot"],
    );

    Map<String, dynamic> toJson() => {
        "ticker": ticker,
        "name": name,
        "market": market,
        "locale": locale,
        "primary_exchange": primaryExchange,
        "type": type,
        "active": active,
        "currency_name": currencyName,
        "cik": cik,
        "composite_figi": compositeFigi,
        "share_class_figi": shareClassFigi,
        "market_cap": marketCap,
        "phone_number": phoneNumber,
        "address": address.toJson(),
        "description": description,
        "sic_code": sicCode,
        "sic_description": sicDescription,
        "ticker_root": tickerRoot,
        "homepage_url": homepageUrl,
        "total_employees": totalEmployees,
        "list_date": "${listDate.year.toString().padLeft(4, '0')}-${listDate.month.toString().padLeft(2, '0')}-${listDate.day.toString().padLeft(2, '0')}",
        "branding": branding.toJson(),
        "share_class_shares_outstanding": shareClassSharesOutstanding,
        "weighted_shares_outstanding": weightedSharesOutstanding,
        "round_lot": roundLot,
    };
}

class Address {
    String address1;
    String city;
    String state;
    String postalCode;

    Address({
        required this.address1,
        required this.city,
        required this.state,
        required this.postalCode,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        address1: json["address1"],
        city: json["city"],
        state: json["state"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "address1": address1,
        "city": city,
        "state": state,
        "postal_code": postalCode,
    };
}

class Branding {
    String logoUrl;
    String iconUrl;

    Branding({
        required this.logoUrl,
        required this.iconUrl,
    });

    factory Branding.fromJson(Map<String, dynamic> json) => Branding(
        logoUrl: json["logo_url"],
        iconUrl: json["icon_url"],
    );

    Map<String, dynamic> toJson() => {
        "logo_url": logoUrl,
        "icon_url": iconUrl,
    };
}
