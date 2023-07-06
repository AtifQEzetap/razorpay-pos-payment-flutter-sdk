import 'dart:convert';

FetchTxnDetailsRequest fetchTxnDetailsRequestFromJson(String str) => FetchTxnDetailsRequest.fromJson(json.decode(str));

String fetchTxnDetailsRequestToJson(FetchTxnDetailsRequest data) => json.encode(data.toJson());

class FetchTxnDetailsRequest {
  String? amount;
  Options? options;

  FetchTxnDetailsRequest({
    this.amount,
    this.options,
  });

  factory FetchTxnDetailsRequest.fromJson(Map<String, dynamic> json) => FetchTxnDetailsRequest(
    amount: json["amount"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "options": options?.toJson(),
  };
}

class Options {
  int? amountTip;
  References? references;
  Customer? customer;
  int? serviceFee;
  AddlData? addlData;
  AppData? appData;

  Options({
    this.amountTip,
    this.references,
    this.customer,
    this.serviceFee,
    this.addlData,
    this.appData,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
    amountTip: json["amountTip"],
    references: json["references"] == null ? null : References.fromJson(json["references"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    serviceFee: json["serviceFee"],
    addlData: json["addlData"] == null ? null : AddlData.fromJson(json["addlData"]),
    appData: json["appData"] == null ? null : AppData.fromJson(json["appData"]),
  );

  Map<String, dynamic> toJson() => {
    "amountTip": amountTip,
    "references": references?.toJson(),
    "customer": customer?.toJson(),
    "serviceFee": serviceFee,
    "addlData": addlData?.toJson(),
    "appData": appData?.toJson(),
  };
}

class AddlData {
  String? addl1;
  String? addl2;
  String? addl3;

  AddlData({
    this.addl1,
    this.addl2,
    this.addl3,
  });

  factory AddlData.fromJson(Map<String, dynamic> json) => AddlData(
    addl1: json["addl1"],
    addl2: json["addl2"],
    addl3: json["addl3"],
  );

  Map<String, dynamic> toJson() => {
    "addl1": addl1,
    "addl2": addl2,
    "addl3": addl3,
  };
}

class AppData {
  String? app1;
  String? app2;
  String? app3;

  AppData({
    this.app1,
    this.app2,
    this.app3,
  });

  factory AppData.fromJson(Map<String, dynamic> json) => AppData(
    app1: json["app1"],
    app2: json["app2"],
    app3: json["app3"],
  );

  Map<String, dynamic> toJson() => {
    "app1": app1,
    "app2": app2,
    "app3": app3,
  };
}

class Customer {
  Customer();

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
  );

  Map<String, dynamic> toJson() => {
  };
}

class References {
  String? reference1;
  List<dynamic>? additionalReferences;

  References({
    this.reference1,
    this.additionalReferences,
  });

  factory References.fromJson(Map<String, dynamic> json) => References(
    reference1: json["reference1"],
    additionalReferences: json["additionalReferences"] == null ? [] : List<dynamic>.from(json["additionalReferences"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "reference1": reference1,
    "additionalReferences": additionalReferences == null ? [] : List<dynamic>.from(additionalReferences!.map((x) => x)),
  };
}