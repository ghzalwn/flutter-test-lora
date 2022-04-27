import 'dart:convert';

CryptoRequest cryptoRequestFromJson(String str) => CryptoRequest.fromJson(json.decode(str));

String cryptoRequestToJson(CryptoRequest data) => json.encode(data.toJson());

class CryptoRequest {
  CryptoRequest({
    this.active,
    // this.sort,
    this.order,
    this.limit,
    this.apiKey,
  });

  bool? active;
  // String? sort;
  String? order;
  int? limit;
  String? apiKey;

  factory CryptoRequest.fromJson(Map<String, dynamic> json) => CryptoRequest(
        active: json["active"],
        // sort: json["sort"],
        order: json["order"],
        limit: json["limit"],
        apiKey: json["apiKey"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        // "sort": sort,
        "order": order,
        "limit": limit,
        "apiKey": apiKey,
      };
}
