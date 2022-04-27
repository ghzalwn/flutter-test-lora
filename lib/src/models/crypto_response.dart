import 'dart:convert';

class CryptoResponse {
  CryptoResponse({
    this.results,
    this.status,
    this.requestId,
    this.count,
    this.nextUrl,
  });

  List<Result>? results;
  String? status;
  String? requestId;
  int? count;
  String? nextUrl;

  factory CryptoResponse.fromJson(Map<String, dynamic> json) => CryptoResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
        nextUrl: json["next_url"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
        "next_url": nextUrl,
      };
}

class Result {
  Result({
    this.ticker,
    this.name,
    this.market,
    this.locale,
    this.primaryExchange,
    this.type,
    this.active,
    this.currencyName,
    this.cik,
    this.compositeFigi,
    this.shareClassFigi,
    this.lastUpdatedUtc,
  });

  String? ticker;
  String? name;
  String? market;
  String? locale;
  String? primaryExchange;
  String? type;
  bool? active;
  String? currencyName;
  String? cik;
  String? compositeFigi;
  String? shareClassFigi;
  DateTime? lastUpdatedUtc;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        ticker: json["ticker"],
        name: json["name"],
        market: json["market"],
        locale: json["locale"],
        primaryExchange: json["primary_exchange"],
        type: json["type"],
        active: json["active"],
        currencyName: json["currency_name"],
        cik: json["cik"] ?? '',
        compositeFigi: json["composite_figi"] ?? '',
        shareClassFigi: json["share_class_figi"] ?? '',
        lastUpdatedUtc: DateTime.parse(json["last_updated_utc"]),
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
        "cik": cik ??= '',
        "composite_figi": compositeFigi ??= null,
        "share_class_figi": shareClassFigi ??= null,
        "last_updated_utc": lastUpdatedUtc?.toIso8601String(),
      };
}
