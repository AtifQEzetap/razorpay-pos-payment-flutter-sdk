import 'dart:convert';

StopPaymentRequest stopPaymentRequestFromJson(String str) => StopPaymentRequest.fromJson(json.decode(str));

String stopPaymentRequestToJson(StopPaymentRequest data) => json.encode(data.toJson());

class StopPaymentRequest {
  List<String>? txnIds;

  StopPaymentRequest({
    this.txnIds,
  });

  factory StopPaymentRequest.fromJson(Map<String, dynamic> json) => StopPaymentRequest(
    txnIds: json["txnIds"] == null ? [] : List<String>.from(json["txnIds"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "txnIds": txnIds == null ? [] : List<dynamic>.from(txnIds!.map((x) => x)),
  };
}