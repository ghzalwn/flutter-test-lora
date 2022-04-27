import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:asklora_flutter_test/src/models/crypto_request.dart';
import 'package:asklora_flutter_test/src/models/crypto_response.dart';
import 'package:asklora_flutter_test/src/repository/crypto_repository.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  List<Result> dataResult;
  String nextUrl;
  CryptoCubit(
    this.dataResult,
    this.nextUrl,
  ) : super(CryptoInitial(result: [], nextUrl: ''));

  CryptoRepositoryInterface cryptoRepository = CryptoRepository();

  void getListCrypto() async {
    try {
      emit(CryptoLoading(result: dataResult));
      final response = await cryptoRepository.getCryptoList(CryptoRequest(
        active: true,
        limit: 20,
        apiKey: 'kAHMK3303qDjYC5gzsKtpCA537NvQIaw',
        order: 'ASC',
      ));
      log(response.toString());
      dataResult.addAll(response!.results!);
      nextUrl = response.nextUrl!;
      // log(data.toString());
      emit(CryptoLoadSuccess(result: dataResult, nextUrl: nextUrl));
    } catch (e) {
      log(e.toString());
      emit(CryptoLoadFailed(result: dataResult));
    }
  }

  void loadMoreListCrypto(String nextUrlReq) async {
    try {
      emit(CryptoLoadMore(result: dataResult));
      final response = await cryptoRepository.loadMoreListCrypto(nextUrlReq);
      dataResult.addAll(response!.results!);
      nextUrl = response.nextUrl!;
      emit(CryptoLoadSuccess(result: dataResult, nextUrl: nextUrl));
    } catch (e) {
      emit(CryptoLoadFailed(result: dataResult));
    }
  }
}
