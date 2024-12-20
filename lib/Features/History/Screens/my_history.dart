import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_states.dart';
import 'package:taxi_go_user_version/Features/History/controller/history_view_model.dart';
import 'package:taxi_go_user_version/Features/History/data/history_data_model.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_details_filter_dropdown.dart';
import 'package:taxi_go_user_version/Features/History/history_widgets/custom_trip_card_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryViewModel, HistoryStates>(
      bloc: HistoryViewModel.get(context)..getHistoryData(context),
      builder: (context, state) {
        if (state is HistorySuccessStates ||
            state is AddToSaveToFavSuccessStates) {
          List<HistoryData> historyData =
              HistoryViewModel.get(context).historyData;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Column(
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
                        return TripCard(
                          rating: historyData[index].ride![0].rate ?? '',
                          driverName: '',
                          from: historyData[index].addressFrom!,
                          to: historyData[index].addressTo!,
                          price: historyData[index].ride![0].total ?? '',
                          timeFrom: '',
                          timeTo: '',
                          onStarPressed: () {
                            HistoryViewModel.get(context).addToFavTrip(
                                context, historyData[index].ride![0].id!);
                            HistoryViewModel.get(context)
                                .getHistoryData(context);
                          },
                          onSavedPressed: () {
                            HistoryViewModel.get(context).saveTrip(
                                context, historyData[index].ride![0].id!);
                            HistoryViewModel.get(context)
                                .getHistoryData(context);
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
          return Center(
            child: Text(state.errMessage),
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
