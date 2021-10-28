import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_net/src/model/getnet_params.dart';
import 'package:get_net/src/model/payment_request.dart';
import 'package:get_net/src/model/save_card_request.dart';
import 'package:get_net/src/model/tokenize_card_request.dart';

import 'get_net_repository.dart';

class GetnetRepositoryImpl implements GetnetRepository {
  late Dio _dioGetnet;
  late GetnetParams _getnetParams;

  GetnetRepositoryImpl(Dio dioGetnet, GetnetParams getnetParams) {
    _dioGetnet = dioGetnet;
    _getnetParams = getnetParams;
  }

  @override
  Future<Response> getAllCardsByCustomerId(String customerId) async {
    return await _dioGetnet
        .get('/v1/cards', queryParameters: {"customer_id": customerId});
  }

  @override
  Future<Response> loginGetNet() async {
    Response response;
    final options = Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          "Authorization": "Basic ${_getnetParams.authorizationBasic}"
        });
    const String url = "/auth/oauth/v2/token";
    response = await _dioGetnet.post(url,
        options: options,
        data: {"scope": "oob", "grant_type": "client_credentials"});
    return response;
  }

  @override
  Future<Response> saveCreditCard(SaveCardRequest cardRequest) async {
    Response response;
    final options =
        Options(headers: {"Content-Type": "application/json; charset=utf-8"});
    const String url = "/v1/cards";
    response = await _dioGetnet.post(url,
        options: options, data: jsonEncode(cardRequest));
    return response;
  }

  @override
  Future<Response> getCardByCardId(String cardId) async {
    return await _dioGetnet.get('/v1/cards/$cardId');
  }

  @override
  Future<Response> tokenizeCreditCard(
      TokenizeCardRequest tokenizeCardRequest) async {
    Response response;
    final options =
        Options(headers: {"Content-Type": "application/json; charset=utf-8"});
    const String url = "/v1/tokens/card";
    response = await _dioGetnet.post(url,
        options: options, data: jsonEncode(tokenizeCardRequest));
    return response;
  }

  @override
  Future<Response> paymentCredCard(PaymentRequest paymentRequest) async {
    Response response;
    final options =
        Options(headers: {"Content-Type": "application/json; charset=utf-8"});
    const String url = "/v1/payments/credit";
    response = await _dioGetnet.post(url,
        options: options, data: jsonEncode(paymentRequest));
    return response;
  }

  @override
  Future<Response> removeCardByCardId(String cardId) async {
    final options = Options(headers: {
      "Content-Type": "application/json; charset=utf-8",
      "seller_id": _getnetParams.sellerId
    });
    return await _dioGetnet.delete('/v1/cards/$cardId', options: options);
  }
}
