import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/Favourite/controller/favorite_states.dart';
import 'package:taxi_go_user_version/Features/Favourite/controller/favorite_view_model.dart';
import 'package:taxi_go_user_version/Features/Favourite/data/favorite_data_model.dart';
import '../trip_favourite_widget/custom_trip_card_favourite.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteViewModel, FavouriteStates>(
      bloc: FavouriteViewModel.get(context)..getFavouriteDate(context),
      builder: (context, state) {
        if (state is FavoriteFailureStates) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        if (state is FavoriteSuccessStates ||
            state is RmvFavoriteSuccessStates) {
          List<FavoriteData> favoriteData =
              FavouriteViewModel.get(context).favoriteData;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: favoriteData.length,
                      itemBuilder: (context, index) {
                        return FavouriteCard(
                          rideData: favoriteData[index].ride!.rideRequest!,
                          onPressed: () {
                            FavouriteViewModel.get(context)
                                .rmvFavTrip(context, favoriteData[index].id!);
                            FavouriteViewModel.get(context)
                                .getFavouriteDate(context);
                          },
                          favoriteRide: favoriteData[index].ride!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.blueColor,
          ),
        );
      },
    );
  }
}
