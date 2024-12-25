import 'package:auto_size_text/auto_size_text.dart';
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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor2,
        centerTitle: true,
        title: AutoSizeText(
          'My Profile',
          style: AppTextStyles.style20BlackW500
              .copyWith(fontWeight: FontWeight.w700),
        ),
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
