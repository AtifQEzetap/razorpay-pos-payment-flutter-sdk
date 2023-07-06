import 'dart:convert';

AttachSignRequest attachSignRequestFromJson(String str) => AttachSignRequest.fromJson(json.decode(str));

String attachSignRequestToJson(AttachSignRequest data) => json.encode(data.toJson());

class AttachSignRequest {
  String? txnId;

  AttachSignRequest({
    this.txnId,
  });

  factory AttachSignRequest.fromJson(Map<String, dynamic> json) => AttachSignRequest(
    txnId: json["txnId"],
  );

  Map<String, dynamic> toJson() => {
    "txnId": txnId,
  };
}