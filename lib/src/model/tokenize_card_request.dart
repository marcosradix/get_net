import 'dart:convert';

TokenizeCardRequest tokenizeCardRequestFromJson(String str) =>
    TokenizeCardRequest.fromJson(json.decode(str));

String tokenizeCardRequestToJson(TokenizeCardRequest data) =>
    json.encode(data.toJson());

class TokenizeCardRequest {
  TokenizeCardRequest({
    required this.cardNumber,
    required this.customerId,
  });

  final String cardNumber;
  final String customerId;

  TokenizeCardRequest copyWith({
    String? cardNumber,
    String? customerId,
  }) =>
      TokenizeCardRequest(
        cardNumber: cardNumber ?? this.cardNumber,
        customerId: customerId ?? this.customerId,
      );

  factory TokenizeCardRequest.fromJson(Map<String, dynamic> json) =>
      TokenizeCardRequest(
        cardNumber: json["card_number"],
        customerId: json["customer_id"],
      );

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "customer_id": customerId,
      };
}
