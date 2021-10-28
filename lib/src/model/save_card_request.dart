import 'dart:convert';

SaveCardRequest saveCardRequestFromJson(String str) =>
    SaveCardRequest.fromJson(json.decode(str));

String saveCardRequestToJson(SaveCardRequest data) =>
    json.encode(data.toJson());

class SaveCardRequest {
  SaveCardRequest({
    this.numberToken,
    this.brand,
    this.cardholderName,
    this.expirationMonth,
    this.expirationYear,
    this.customerId,
    this.verifyCard,
    this.securityCode,
  });

  final String? numberToken;
  final String? brand;
  final String? cardholderName;
  final String? expirationMonth;
  final String? expirationYear;
  final String? customerId;
  final bool? verifyCard;
  final String? securityCode;

  SaveCardRequest copyWith({
    String? numberToken,
    String? brand,
    String? cardholderName,
    String? expirationMonth,
    String? expirationYear,
    String? customerId,
    String? cardholderIdentification,
    bool? verifyCard,
    String? securityCode,
  }) =>
      SaveCardRequest(
        numberToken: numberToken ?? this.numberToken,
        brand: brand ?? this.brand,
        cardholderName: cardholderName ?? this.cardholderName,
        expirationMonth: expirationMonth ?? this.expirationMonth,
        expirationYear: expirationYear ?? this.expirationYear,
        customerId: customerId ?? this.customerId,
        verifyCard: verifyCard ?? this.verifyCard,
        securityCode: securityCode ?? this.securityCode,
      );

  factory SaveCardRequest.fromJson(Map<String, dynamic> json) =>
      SaveCardRequest(
        numberToken: json["number_token"],
        brand: json["brand"],
        cardholderName: json["cardholder_name"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        customerId: json["customer_id"],
        verifyCard: json["verify_card"],
        securityCode: json["security_code"],
      );

  Map<String, dynamic> toJson() => {
        "number_token": numberToken,
        "brand": brand,
        "cardholder_name": cardholderName,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "customer_id": customerId,
        "verify_card": verifyCard,
        "security_code": securityCode,
      };
}
