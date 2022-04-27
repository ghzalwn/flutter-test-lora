import 'dart:developer';

import 'package:asklora_flutter_test/src/models/crypto_request.dart';
import 'package:asklora_flutter_test/src/models/crypto_response.dart';
import 'package:asklora_flutter_test/src/utils/api_service.dart';
import 'package:asklora_flutter_test/src/utils/endpoint.dart';

abstract class CryptoRepositoryInterface {
  Future<CryptoResponse?> getCryptoList(CryptoRequest request);
  Future<CryptoResponse?> loadMoreListCrypto(String nextUrl);
}

class CryptoRepository implements CryptoRepositoryInterface {
  final apiService = ApiService();

  @override
  Future<CryptoResponse?> getCryptoList(CryptoRequest request) async {
    try {
      final response = await apiService.callApi().get(Endpoint.cryptoListEndpoint, queryParameters: request.toJson());
      log('response -> ' + response.toString());
      return CryptoResponse.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Future<CryptoResponse?> loadMoreListCrypto(String nextUrl) async {
    try {
      Map<String, dynamic> req = {};
      req['apiKey'] = 'kAHMK3303qDjYC5gzsKtpCA537NvQIaw';
      log(nextUrl);
      log(req.toString());
      final response = await apiService.callApi().get(nextUrl, queryParameters: req);
      log('response -> ' + response.toString());
      return CryptoResponse.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
