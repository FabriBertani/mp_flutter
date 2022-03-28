import 'package:mp_flutter/src/models/card/identification.dart';

class CardHolder {
  Identification? identification;
  String? name;

  CardHolder({
    this.identification,
    this.name
  });

  factory CardHolder.fromJson(Map<String, dynamic> json) =>
    CardHolder(
      identification: json["identification"] ?? Identification(),
      name: json["name"] ?? ""
    );
  
  Map<String, dynamic> toJson() => {
    "identification": identification,
    "name": name
  };
}