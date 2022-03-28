class Identification {
  String? number;
  String? type;

  Identification({
    this.number,
    this.type
  });

  factory Identification.fromJson(Map<String, dynamic> json) =>
    Identification(
      number: json["number"] ?? "",
      type: json["type"] ?? ""
    );

  Map<String, dynamic> toJson() => {
    "number": number,
    "type": type
  };
}