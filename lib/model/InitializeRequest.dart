import 'dart:convert';

InitializeRequest initializeRequestFromJson(String str) => InitializeRequest.fromJson(json.decode(str));

String initializeRequestToJson(InitializeRequest data) => json.encode(data.toJson());

class InitializeRequest {
  String prodAppKey;
  String demoAppKey;
  String merchantName;
  String userName;
  String currencyCode;
  String appMode;
  bool captureSignature;
  bool prepareDevice;
  bool captureReceipt;

  InitializeRequest({
    required this.prodAppKey,
    required this.demoAppKey,
    required this.merchantName,
    required this.userName,
    required this.currencyCode,
    required this.appMode,
    required this.captureSignature,
    required this.prepareDevice,
    required this.captureReceipt,
  });

  factory InitializeRequest.fromJson(Map<String, dynamic> json) => InitializeRequest(
    prodAppKey: json["prodAppKey"],
    demoAppKey: json["demoAppKey"],
    merchantName: json["merchantName"],
    userName: json["userName"],
    currencyCode: json["currencyCode"],
    appMode: json["appMode"],
    captureSignature: json["captureSignature"],
    prepareDevice: json["prepareDevice"],
    captureReceipt: json["captureReceipt"],
  );

  Map<String, dynamic> toJson() => {
    "prodAppKey": prodAppKey,
    "demoAppKey": demoAppKey,
    "merchantName": merchantName,
    "userName": userName,
    "currencyCode": currencyCode,
    "appMode": appMode,
    "captureSignature": captureSignature,
    "prepareDevice": prepareDevice,
    "captureReceipt": captureReceipt,
  };
}
