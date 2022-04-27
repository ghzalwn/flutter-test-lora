import 'dart:convert';
import 'dart:developer';

import 'package:asklora_flutter_test/src/models/crypto_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  List<Result> dataListFav;
  FavoriteCubit(this.dataListFav) : super(FavoriteInitial(listFav: []));

  void getListFavorite() async {
    try {
      emit(FavoriteLoading(listFav: dataListFav));
      log(dataListFav.toString());
      emit(FavoriteLoadSuccess(listFav: dataListFav));
    } catch (e) {
      log(e.toString());
      emit(FavoriteLoadFailed(listFav: dataListFav));
    }
  }

  void addToFavorite(Result? fav) async {
    try {
      emit(FavoriteLoading(listFav: dataListFav));
      dataListFav.add(fav!);
      FavoriteAddSuccess(listFav: dataListFav);
    } catch (e) {
      log(e.toString());
      emit(FavoriteLoadFailed(listFav: dataListFav));
    }
  }
}
