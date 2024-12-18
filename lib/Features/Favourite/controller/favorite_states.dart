import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';

abstract class FavouriteStates {}

class FavoriteLoadingStates extends FavouriteStates {}

class FavoriteFailureStates extends FavouriteStates {
  final String errMessage;
  FavoriteFailureStates({required this.errMessage});
}

class FavoriteSuccessStates extends FavouriteStates {
  final FavoriteDataModel favoriteDataModel;
  FavoriteSuccessStates({required this.favoriteDataModel});
}
