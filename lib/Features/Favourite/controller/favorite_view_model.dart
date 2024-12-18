import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Features/Favourite/controller/favorite_states.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/repo/favorite_repo.dart';

class FavouriteViewModel extends Cubit<FavouriteStates> {
  FavouriteViewModel({required this.favoriteRepo})
      : super(FavoriteLoadingStates());
  FavouriteRepo favoriteRepo;

  static FavouriteViewModel get(context) => BlocProvider.of(context);
  getFavouriteDate(BuildContext context) async {
    emit(FavoriteLoadingStates());
    var either = await favoriteRepo.getData(context);
    either.fold(
      (favouriteFailure) {
        emit(FavoriteFailureStates(errMessage: favouriteFailure.message));
      },
      (favouriteResponse) {
        emit(FavoriteSuccessStates(favoriteDataModel: favouriteResponse));
      },
    );
  }
}
