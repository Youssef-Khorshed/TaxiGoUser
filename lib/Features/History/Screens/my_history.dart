import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/services_locator.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_failure_view.dart';
import 'package:taxi_go_user_version/Features/Favourite/controller/favorite_view_model.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_history_drop_down.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';
import 'package:taxi_go_user_version/Features/Saved/controller/saved_view_model.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) => getIt.get<HistoryViewModel>()
          ..getHistoryData(context, tripHistory: "day"),
        child: BlocBuilder<HistoryViewModel, HistoryStates>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is HistorySuccessStates) {
              List<HistoryData> historyData =
                  HistoryViewModel.get(context).historyData;
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(child: CustomDetailsfilterdropdown()),
                        ],
                      ),
                      historyData.isEmpty
                          ? verticalSpace(
                              MediaQuery.of(context).size.height / 5)
                          : verticalSpace(16.h),
                      historyData.isEmpty
                          ? CustomEmptyDataView(
                              message:
                                  AppLocalizations.of(context)!.empty_message)
                          : Expanded(
                              child: ListView.builder(
                                itemCount: historyData.length,
                                itemBuilder: (context, index) {
                                  return HistoryTripCard(
                                    onStarPressed: () {
                                      favmethod(historyData, index, context);
                                    },
                                    onSavedPressed: () {
                                      saveMethod(historyData, index, context);
                                    },
                                    historyData: historyData[index],
                                    index: index,
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              );
            } else if (state is HistoryFailureStates) {
              return CustomFailureView(message: state.errMessage);
            }

            return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Skeletonizer(
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(child: CustomDetailsfilterdropdown()),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) =>
                                    const CustomDummyWidget()),
                          ),
                        ],
                      ),
                    )));
          },
        ),
      ),
    );
  }

  Future<void> saveMethod(
      List<HistoryData> historyData, int index, BuildContext context) async {
    if (historyData[index].isSaved == true) {
      await SavedViewModel.get(context)
          .unSaveTrip(context, historyData[index].ride![0].id!);
    } else {
      SavedViewModel.get(context)
          .saveTrip(context, historyData[index].ride![0].id!);
    }
    // HistoryViewModel.get(context).getHistoryData(context);
  }

  Future<void> favmethod(
      List<HistoryData> historyData, int index, BuildContext context) async {
    if (historyData[index].isFavorite == true) {
      context
          .read<FavouriteViewModel>()
          .rmvFavTrip(context, historyData[index].ride![0].id!);
    } else {
      context
          .read<FavouriteViewModel>()
          .addToFavTrip(context, historyData[index].ride![0].id!);
    }
    //  HistoryViewModel.get(context).getHistoryData(context);
  }
}
