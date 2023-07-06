import 'dart:convert';

RefundRequest refundRequestFromJson(String str) => RefundRequest.fromJson(json.decode(str));

String refundRequestToJson(RefundRequest data) => json.encode(data.toJson());

class RefundRequest {
  String amount;
  String txnId;

  RefundRequest({
    required this.amount,
    required this.txnId,
  });

  factory RefundRequest.fromJson(Map<String, dynamic> json) => RefundRequest(
    amount: json["amount"],
    txnId: json["txnId"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "txnId": txnId,
  };
}