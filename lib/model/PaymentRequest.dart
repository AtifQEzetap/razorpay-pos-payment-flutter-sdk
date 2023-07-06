import 'dart:convert';

PaymentRequest paymentRequestFromJson(String str) => PaymentRequest.fromJson(json.decode(str));

String paymentRequestToJson(PaymentRequest data) => json.encode(data.toJson());

class PaymentRequest {
  String? amount;
  Options? options;

  PaymentRequest({
    this.amount,
    this.options,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
    amount: json["amount"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "options": options?.toJson(),
  };
}

class Options {
  int? serviceFee;
  String? paymentBy;
  String? paymentMode;
  String? providerName;
  String? emiType;
  References? references;
  AppData? appData;
  Customer? customer;

  Options({
    this.serviceFee,
    this.paymentBy,
    this.paymentMode,
    this.providerName,
    this.emiType,
    this.references,
    this.appData,
    this.customer,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    serviceFee: json["serviceFee"],
    paymentBy: json["paymentBy"],
    paymentMode: json["paymentMode"],
    providerName: json["providerName"],
    emiType: json["emiType"],
    references: json["references"] == null ? null : References.fromJson(json["references"]),
    appData: json["appData"] == null ? null : AppData.fromJson(json["appData"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "serviceFee": serviceFee,
    "paymentBy": paymentBy,
    "paymentMode": paymentMode,
    "providerName": providerName,
    "emiType": emiType,
    "references": references?.toJson(),
    "appData": appData?.toJson(),
    "customer": customer?.toJson(),
  };
}

class AppData {
  String? walletAcquirer;

  AppData({
    this.walletAcquirer,
  });

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
    walletAcquirer: json["walletAcquirer"],
  );

  Map<String, dynamic> toJson() => {
    "walletAcquirer": walletAcquirer,
  };
}

class Customer {
  String? name;
  String? mobileNo;
  String? email;

  Customer({
    this.name,
    this.mobileNo,
    this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    mobileNo: json["mobileNo"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mobileNo": mobileNo,
    "email": email,
  };
}

class References {
  String? reference1;
  String? reference2;
  String? reference3;
  List<String>? additionalReferences;

  References({
    this.reference1,
    this.reference2,
    this.reference3,
    this.additionalReferences,
  });

  factory References.fromJson(Map<String, dynamic> json) => References(
    reference1: json["reference1"],
    reference2: json["reference2"],
    reference3: json["reference3"],
    additionalReferences: json["additionalReferences"] == null ? [] : List<String>.from(json["additionalReferences"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "reference1": reference1,
    "reference2": reference2,
    "reference3": reference3,
    "additionalReferences": additionalReferences == null ? [] : List<dynamic>.from(additionalReferences!.map((x) => x)),
  };
}
