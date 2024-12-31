import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_failure_view.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_states.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_view_model.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/dummy_profile_body.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/profile_info_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor2,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.profile,
            style: AppTextStyles.style16BlackW600),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.blueColor,
            )),
      ),
      backgroundColor: AppColors.whiteColor2,
      body: BlocBuilder<ProfileViewModel, ProfileStates>(
        bloc: ProfileViewModel.get(context)..fetchPrfaileInfo(context),
        builder: (context, state) {
          if (state is ProfileFailureStates) {
            return CustomFailureView(
              message: state.errMessage,
            );
          }
          if (state is ProfileSuccessStates) {
            return ProfileInfoBody(
              userInfo: state.profielModel.data!.user!,
            );
          }
          return const Skeletonizer(child: DummyProfileBody());
        },
      ),
    );
  }
}
