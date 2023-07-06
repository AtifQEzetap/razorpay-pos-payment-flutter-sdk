import 'dart:convert';

SendReceiptRequest sendReceiptRequestFromJson(String str) => SendReceiptRequest.fromJson(json.decode(str));

String sendReceiptRequestToJson(SendReceiptRequest data) => json.encode(data.toJson());

class SendReceiptRequest {
  String customerName;
  String mobileNo;
  String email;
  String txnId;

  SendReceiptRequest({
    required this.customerName,
    required this.mobileNo,
    required this.email,
    required this.txnId,
  });

  factory SendReceiptRequest.fromJson(Map<String, dynamic> json) => SendReceiptRequest(
    customerName: json["customerName"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    txnId: json["txnId"],
  );

  Map<String, dynamic> toJson() => {
    "customerName": customerName,
    "mobileNo": mobileNo,
    "email": email,
    "txnId": txnId,
  };
}
