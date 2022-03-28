import 'package:mp_flutter/src/models/card/card_holder.dart';

class Card {
  String? securityCode;
  String? expirationYear;
  int? expirationMonth;
  String? cardNumber;
  CardHolder? cardHolder;

  Card({
    this.securityCode,
    this.expirationYear,
    this.expirationMonth,
    this.cardNumber,
    this.cardHolder
  });

  factory Card.fromJson(Map<String, dynamic> json) =>
    Card(
      securityCode: json["securityCode"] ?? "",
      expirationYear: json["expirationYear"] ?? "",
      expirationMonth: json["expirationMonth"] ?? 0,
      cardNumber: json["cardNumber"] ?? "",
      cardHolder: json["cardHolder"] ?? CardHolder()
    );

  Map<String, dynamic> toJson() => {
    "securityCode": securityCode,
    "expirationYear": expirationYear,
    "expirationMonth": expirationMonth,
    "cardNumber": cardNumber,
    "cardHolder": cardHolder
  };
}