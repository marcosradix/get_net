import 'dart:convert';

PaymentRequest paymentRequestFromJson(String str) =>
    PaymentRequest.fromJson(json.decode(str));

String paymentRequestToJson(PaymentRequest data) => json.encode(data.toJson());

class PaymentRequest {
  PaymentRequest({
    this.sellerId,
    this.amount,
    this.currency,
    this.order,
    this.customer,
    this.device,
    this.credit,
  });

  final String? sellerId;
  final int? amount;
  final String? currency;
  final Order? order;
  final Customer? customer;
  final Device? device;
  final Credit? credit;

  PaymentRequest copyWith({
    String? sellerId,
    int? amount,
    String? currency,
    Order? order,
    Customer? customer,
    Device? device,
    Credit? credit,
  }) =>
      PaymentRequest(
        sellerId: sellerId ?? this.sellerId,
        amount: amount ?? this.amount,
        currency: currency ?? this.currency,
        order: order ?? this.order,
        customer: customer ?? this.customer,
        device: device ?? this.device,
        credit: credit ?? this.credit,
      );

  factory PaymentRequest.fromJson(Map<String, dynamic> json) => PaymentRequest(
        sellerId: json["seller_id"],
        amount: json["amount"],
        currency: json["currency"],
        order: Order.fromJson(json["order"]),
        customer: Customer.fromJson(json["customer"]),
        device: Device.fromJson(json["device"]),
        credit: Credit.fromJson(json["credit"]),
      );

  Map<String, dynamic> toJson() => {
        "seller_id": sellerId,
        "amount": amount,
        "currency": currency,
        "order": order != null ? order!.toJson() : null,
        "customer": customer != null ? customer!.toJson() : null,
        "device": device != null ? device!.toJson() : null,
        "credit": credit != null ? credit!.toJson() : null,
      };
}

class Credit {
  Credit({
    required this.delayed,
    required this.preAuthorization,
    required this.saveCardData,
    required this.transactionType,
    required this.numberInstallments,
    required this.softDescriptor,
    required this.dynamicMcc,
    required this.card,
  });

  final bool delayed;
  final bool preAuthorization;
  final bool saveCardData;
  final String transactionType;
  final int numberInstallments;
  final String softDescriptor;
  final int dynamicMcc;
  final CardPayment card;

  Credit copyWith({
    bool? delayed,
    bool? preAuthorization,
    bool? saveCardData,
    String? transactionType,
    int? numberInstallments,
    String? softDescriptor,
    int? dynamicMcc,
    CardPayment? card,
  }) =>
      Credit(
        delayed: delayed ?? this.delayed,
        preAuthorization: preAuthorization ?? this.preAuthorization,
        saveCardData: saveCardData ?? this.saveCardData,
        transactionType: transactionType ?? this.transactionType,
        numberInstallments: numberInstallments ?? this.numberInstallments,
        softDescriptor: softDescriptor ?? this.softDescriptor,
        dynamicMcc: dynamicMcc ?? this.dynamicMcc,
        card: card ?? this.card,
      );

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        delayed: json["delayed"],
        preAuthorization: json["pre_authorization"],
        saveCardData: json["save_card_data"],
        transactionType: json["transaction_type"],
        numberInstallments: json["number_installments"],
        softDescriptor: json["soft_descriptor"],
        dynamicMcc: json["dynamic_mcc"],
        card: CardPayment.fromJson(json["card"]),
      );

  Map<String, dynamic> toJson() => {
        "delayed": delayed,
        "pre_authorization": preAuthorization,
        "save_card_data": saveCardData,
        "transaction_type": transactionType,
        "number_installments": numberInstallments,
        "soft_descriptor": softDescriptor,
        "dynamic_mcc": dynamicMcc,
        "card": card.toJson(),
      };
}

class CardPayment {
  CardPayment({
    required this.numberToken,
    required this.cardholderName,
    required this.securityCode,
    required this.brand,
    required this.expirationMonth,
    required this.expirationYear,
  });

  final String numberToken;
  final String cardholderName;
  final String securityCode;
  final String brand;
  final String expirationMonth;
  final String expirationYear;

  CardPayment copyWith({
    String? numberToken,
    String? cardholderName,
    String? securityCode,
    String? brand,
    String? expirationMonth,
    String? expirationYear,
  }) =>
      CardPayment(
        numberToken: numberToken ?? this.numberToken,
        cardholderName: cardholderName ?? this.cardholderName,
        securityCode: securityCode ?? this.securityCode,
        brand: brand ?? this.brand,
        expirationMonth: expirationMonth ?? this.expirationMonth,
        expirationYear: expirationYear ?? this.expirationYear,
      );

  factory CardPayment.fromJson(Map<String, dynamic> json) => CardPayment(
        numberToken: json["number_token"],
        cardholderName: json["cardholder_name"],
        securityCode: json["security_code"],
        brand: json["brand"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
      );

  Map<String, dynamic> toJson() => {
        "number_token": numberToken,
        "cardholder_name": cardholderName,
        "security_code": securityCode,
        "brand": brand,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
      };
}

class Customer {
  Customer({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.name,
    required this.email,
    required this.documentType,
    required this.documentNumber,
    required this.phoneNumber,
    required this.billingAddress,
  });

  final String customerId;
  final String firstName;
  final String lastName;
  final String name;
  final String email;
  final String documentType;
  final String documentNumber;
  final String phoneNumber;
  final Address billingAddress;

  Customer copyWith({
    String? customerId,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? documentType,
    String? documentNumber,
    String? phoneNumber,
    Address? billingAddress,
  }) =>
      Customer(
        customerId: customerId ?? this.customerId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        name: name ?? this.name,
        email: email ?? this.email,
        documentType: documentType ?? this.documentType,
        documentNumber: documentNumber ?? this.documentNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        billingAddress: billingAddress ?? this.billingAddress,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        customerId: json["customer_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        documentType: json["document_type"],
        documentNumber: json["document_number"],
        phoneNumber: json["phone_number"],
        billingAddress: Address.fromJson(json["billing_address"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "document_type": documentType,
        "document_number": documentNumber,
        "phone_number": phoneNumber,
        "billing_address": billingAddress.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });

  final String street;
  final String number;
  final String complement;
  final String district;
  final String city;
  final String state;
  final String country;
  final String postalCode;

  Address copyWith({
    String? street,
    String? number,
    String? complement,
    String? district,
    String? city,
    String? state,
    String? country,
    String? postalCode,
  }) =>
      Address(
        street: street ?? this.street,
        number: number ?? this.number,
        complement: complement ?? this.complement,
        district: district ?? this.district,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        number: json["number"],
        complement: json["complement"],
        district: json["district"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "number": number,
        "complement": complement,
        "district": district,
        "city": city,
        "state": state,
        "country": country,
        "postal_code": postalCode,
      };
}

class Device {
  Device({
    required this.ipAddress,
    required this.deviceId,
  });

  final String ipAddress;
  final String deviceId;

  Device copyWith({
    String? ipAddress,
    String? deviceId,
  }) =>
      Device(
        ipAddress: ipAddress ?? this.ipAddress,
        deviceId: deviceId ?? this.deviceId,
      );

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        ipAddress: json["ip_address"],
        deviceId: json["device_id"],
      );

  Map<String, dynamic> toJson() => {
        "ip_address": ipAddress,
        "device_id": deviceId,
      };
}

class Order {
  Order({
    required this.orderId,
    required this.salesTax,
    required this.productType,
  });

  final String orderId;
  final int salesTax;
  final String productType;

  Order copyWith({
    String? orderId,
    int? salesTax,
    String? productType,
  }) =>
      Order(
        orderId: orderId ?? this.orderId,
        salesTax: salesTax ?? this.salesTax,
        productType: productType ?? this.productType,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        salesTax: json["sales_tax"],
        productType: json["product_type"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "sales_tax": salesTax,
        "product_type": productType,
      };
}
