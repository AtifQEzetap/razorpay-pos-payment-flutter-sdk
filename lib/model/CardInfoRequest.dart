import 'dart:convert';

CardInfoRequest cardInfoRequestFromJson(String str) => CardInfoRequest.fromJson(json.decode(str));

String cardInfoRequestToJson(CardInfoRequest data) => json.encode(data.toJson());

class CardInfoRequest {
  String cardType;

  CardInfoRequest({
    required this.cardType,
  });

  factory CardInfoRequest.fromJson(Map<String, dynamic> json) => CardInfoRequest(
    cardType: json["cardType"],
  );

  Map<String, dynamic> toJson() => {
    "cardType": cardType,
  };
}