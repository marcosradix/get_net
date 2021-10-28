import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_net/src/get_net.dart';

void main() {
  test('consumir api viacep', () async {
    GetnetRepository _getnetRepository = GetnetRepositoryImpl(
        Dio(),
        GetnetParams(
            authorizationBasic: "myAuthorizationBasic",
            clientId: "myClientId",
            clientSecret: "myClientSecret",
            sellerId: "mySellerId",
            urlGetnetApi: "myUrlGetnetApi"));
    String accessToken = "";
    _getnetRepository.loginGetNet().then(
        (response) => accessToken = response.data['access_token'] as String);
    expect(accessToken, isA<String>());
  });
}
