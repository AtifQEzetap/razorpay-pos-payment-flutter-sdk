import 'dart:convert';

ServiceRequest serviceRequestFromJson(String str) => ServiceRequest.fromJson(json.decode(str));

String serviceRequestToJson(ServiceRequest data) => json.encode(data.toJson());

class ServiceRequest {
  String? issueType;
  String? issueInfo;
  List<String>? tags;

  ServiceRequest({
    this.issueType,
    this.issueInfo,
    this.tags,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) => ServiceRequest(
    issueType: json["issueType"],
    issueInfo: json["issueInfo"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "issueType": issueType,
    "issueInfo": issueInfo,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
  };
}
