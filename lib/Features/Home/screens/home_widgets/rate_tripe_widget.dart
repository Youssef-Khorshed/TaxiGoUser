import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/Home/controller/rate_%20cancel_cubit/rete_cancel_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/controller/ride_complete_cubit/ride_complete_details_cubit.dart';
import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/feedback_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RateTripeWidget extends StatelessWidget {
  const RateTripeWidget({
    super.key,
    required this.size,
  });

  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateCancelCubit, RateCancelState>(
      builder: (context, state) {
        final cubit = context.read<RateCancelCubit>();
        if (state is RideCompleteDetailsInitial) {}
        return Center(
          child: Column(
            children: [
              AutoSizeText(
                AppLocalizations.of(context)!.how_is_your_trip,
                style: AppTextStyles.style18BlackW600,
              ),
              verticalSpace(5.h),
              RatingBar.builder(
                initialRating: cubit.rate < 1 ? 1 : cubit.rate,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: size.height * 0.04,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0.h),
                itemBuilder: (context, _) => const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  cubit.rateBtn(rating);
                },
              ),
              verticalSpace(10.h),
              // Feedback Box
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '${AppLocalizations.of(context)!.write_your_feedback} ',
                    style: AppTextStyles.style16BlackW600,
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
                child: FeedbackField(
                  feedBackController: cubit.feedBackController,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
