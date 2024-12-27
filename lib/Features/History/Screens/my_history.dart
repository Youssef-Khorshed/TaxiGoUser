import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_dummy_widget.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_empty_data_view.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_failure_view.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<HistoryViewModel, HistoryStates>(
        bloc: HistoryViewModel.get(context)..getHistoryData(context),
        buildWhen: (previous, current) => current != previous,
        builder: (context, state) {
          if (state is HistorySuccessStates ||
              state is AddToSaveToFavSuccessStates) {
            List<HistoryData> historyData =
                HistoryViewModel.get(context).historyData;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                child: historyData.isEmpty
                    ? CustomEmptyDataView(
                        message: AppLocalizations.of(context)!.empty_message)
                    : Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(child: CustomDetailsfilterdropdown()),
                            ],
                          ),
                          verticalSpace(16.h),
                          Expanded(
                            child: ListView.builder(
                              itemCount: historyData.length,
                              itemBuilder: (context, index) {
                                return HistoryTripCard(
                                  onStarPressed: () {
                                    if (historyData[index].isFavorite == true) {
                                      return;
                                    } else {
                                      HistoryViewModel.get(context)
                                          .addToFavTrip(context,
                                              historyData[index].ride![0].id!);
                                      HistoryViewModel.get(context)
                                          .getHistoryData(context);
                                    }
                                  },
                                  onSavedPressed: () {
                                    if (historyData[index].isSaved == true) {
                                      return;
                                    } else {
                                      HistoryViewModel.get(context).saveTrip(
                                          context,
                                          historyData[index].ride![0].id!);
                                      HistoryViewModel.get(context)
                                          .getHistoryData(context);
                                    }
                                  },
                                  historyData: historyData[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            );
          }
          if (state is HistoryFailureStates) {
            return CustomFailureView(message: state.errMessage);
          }
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
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
    );
  }
}
