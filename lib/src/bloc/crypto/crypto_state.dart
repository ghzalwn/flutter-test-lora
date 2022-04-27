part of 'crypto_cubit.dart';

abstract class CryptoState {
  List<Result> result;
  String? nextUrl;
  CryptoState({required this.result, this.nextUrl});
}

class CryptoInitial extends CryptoState {
  CryptoInitial({required List<Result> result, String? nextUrl}) : super(result: result, nextUrl: nextUrl);
}

class CryptoLoading extends CryptoState {
  CryptoLoading({required List<Result> result, String? nextUrl}) : super(result: result, nextUrl: nextUrl);
}

class CryptoLoadSuccess extends CryptoState {
  CryptoLoadSuccess({required List<Result> result, String? nextUrl}) : super(result: result, nextUrl: nextUrl);
}

class CryptoLoadFailed extends CryptoState {
  final String? errorMessage;
  CryptoLoadFailed({this.errorMessage, required List<Result> result, String? nextUrl}) : super(result: result, nextUrl: nextUrl);
}

class CryptoLoadMore extends CryptoState {
  CryptoLoadMore({required List<Result> result, String? nextUrl}) : super(result: result, nextUrl: nextUrl);
}
