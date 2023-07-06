import 'dart:convert';

SearchTxnRequest searchTxnRequestFromJson(String str) => SearchTxnRequest.fromJson(json.decode(str));

String searchTxnRequestToJson(SearchTxnRequest data) => json.encode(data.toJson());

class SearchTxnRequest {
  String? agentName;
  bool? saveLocally;

  SearchTxnRequest({
    this.agentName,
    this.saveLocally,
  });

  factory SearchTxnRequest.fromJson(Map<String, dynamic> json) => SearchTxnRequest(
    agentName: json["agentName"],
    saveLocally: json["saveLocally"],
  );

  Map<String, dynamic> toJson() => {
    "agentName": agentName,
    "saveLocally": saveLocally,
  };
}