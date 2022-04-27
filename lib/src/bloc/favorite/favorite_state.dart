part of 'favorite_cubit.dart';

abstract class FavoriteState {
  List<Result> listFav;
  FavoriteState({required this.listFav});

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {
  FavoriteInitial({required List<Result> listFav}) : super(listFav: listFav);
}

class FavoriteLoading extends FavoriteState {
  FavoriteLoading({required List<Result> listFav}) : super(listFav: listFav);
}

class FavoriteLoadSuccess extends FavoriteState {
  FavoriteLoadSuccess({required List<Result> listFav}) : super(listFav: listFav);
}

class FavoriteLoadFailed extends FavoriteState {
  final String? messageError;
  FavoriteLoadFailed({required List<Result> listFav, this.messageError}) : super(listFav: listFav);
}

class FavoriteAddSuccess extends FavoriteState {
  FavoriteAddSuccess({required List<Result> listFav}) : super(listFav: listFav);
}

class FavoriteAddFailed extends FavoriteState {
  final String? messageError;
  FavoriteAddFailed({required List<Result> listFav, this.messageError}) : super(listFav: listFav);
}
