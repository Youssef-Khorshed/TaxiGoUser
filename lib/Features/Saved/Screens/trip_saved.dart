import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_states.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_view_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedViewModel, SavedStates>(
      bloc: SavedViewModel.get(context)..getSavedData(context),
      builder: (context, state) {
        if (state is SavedFailureStates) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        if (state is SavedSuccessStates || state is UnSaveTripSuccessStates) {
          List<SavedData> savedData = SavedViewModel.get(context).savedDataList;
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
                      itemCount: savedData.length,
                      itemBuilder: (context, index) {
                        return TripCard(
                          rating: savedData[index].ride!.rate!,
                          driverName: '',
                          from: 'state',
                          to: 'home',
                          price: savedData[index].ride!.total!,
                          timeFrom: '',
                          timeTo: '',
                          onStarPressed: () {},
                          onSavedPressed: () {
                            SavedViewModel.get(context).unSaveTrip(context, 4);
                          },
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
            color: AppColors.blueColor2,
          ),
        );
      },
    );
  }
}
