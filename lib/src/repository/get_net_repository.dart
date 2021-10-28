import 'package:dio/dio.dart';
import 'package:get_net/src/model/payment_request.dart';
import 'package:get_net/src/model/save_card_request.dart';
import 'package:get_net/src/model/tokenize_card_request.dart';

abstract class GetnetRepository {
  Future<Response> getAllCardsByCustomerId(String customerId);

  Future<Response> loginGetNet();

  Future<Response> saveCreditCard(SaveCardRequest cardRequest);

  Future<Response> getCardByCardId(String cardId);

  Future<Response> tokenizeCreditCard(TokenizeCardRequest tokenizeCardRequest);

  Future<Response> paymentCredCard(PaymentRequest paymentRequest);

  Future<Response> removeCardByCardId(String cardId);
}
