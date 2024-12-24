import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_failure_view.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_states.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_view_model.dart';
import 'package:taxi_go_user_version/Features/Saved/data/saved_data_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_user_version/Features/Saved/tripSaved_widget/saved_trip_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedViewModel, SavedStates>(
      bloc: SavedViewModel.get(context)..getSavedData(context),
      builder: (context, state) {
        if (state is SavedFailureStates) {
          return CustomFailureView(message: state.errMessage);
        }
        if (state is SavedSuccessStates || state is UnSaveTripSuccessStates) {
          List<SavedData> savedData = SavedViewModel.get(context).savedDataList;
          return savedData.isEmpty
              ? CustomEmptyDataView(
                  message: AppLocalizations.of(context)!.empty_message)
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: savedData.length,
                            itemBuilder: (context, index) {
                              return SavedTripCard(
                                onSavedPressed: () {
                                  SavedViewModel.get(context).unSaveTrip(
                                      context, savedData[index].id!);
                                  SavedViewModel.get(context)
                                      .getSavedData(context);
                                },
                                savedData: savedData[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const Skeletonizer(
                        child: CustomDummyWidget(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
