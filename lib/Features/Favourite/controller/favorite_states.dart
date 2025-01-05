import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/rmove_favorite_model.dart';
import 'package:taxi_go_user_version/Features/History/data/save_trip_model.dart';

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

class RmvFavoriteFailureStates extends FavouriteStates {
  final String errMessage;
  RmvFavoriteFailureStates({required this.errMessage});
}

class RmvFavoriteSuccessStates extends FavouriteStates {
  final RemoveFavoriteModel rmvFavModel;
  RmvFavoriteSuccessStates({required this.rmvFavModel});
}

class AddTofavSuccessStates extends FavouriteStates {
  AddToSaveToFavTripModel addToSaveToFavTripModel;
  AddTofavSuccessStates({required this.addToSaveToFavTripModel});
}
