import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
import 'package:taxi_go_user_version/Features/App/app_widgets/custom_failure_view.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_states.dart';
import 'package:taxi_go_user_version/Features/Profile/controller/profile_view_model.dart';
import 'package:taxi_go_user_version/Features/Profile/data/profile_model.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chage_language_profile.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_raw_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:taxi_go_user_version/Features/Profile/profile_widgets/dummy_porfile_loading_state_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        elevation: 0,
        centerTitle: true,
        title: AutoSizeText(
          'Profile',
          style: AppTextStyles.style20WhiteW600,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: AppColors.whiteColor,
            )),
      ),
      backgroundColor: AppColors.blueColor,
      body: BlocBuilder<ProfileViewModel, ProfileStates>(
        bloc: ProfileViewModel.get(context)..fetchPrfaileInfo(context),
        builder: (context, state) {
          if (state is ProfileFailureStates) {
            return CustomFailureView(
              message: state.errMessage,
            );
          }
          if (state is ProfileSuccessStates) {
            UserInfo userInfo = state.profielModel.data!.user!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpace(size.height * 0.15),
                Container(
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(userInfo.picture ??
                          'https://mrwallpaper.com/images/high/cool-profile-pictures-bart-xxxtentacion-qriuzlsntbbl9cv5.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomRawProfile(
                          title: AppLocalizations.of(context)!.name,
                          content: userInfo.name!),
                      CustomRawProfile(
                          title: AppLocalizations.of(context)!.gender,
                          content: userInfo.gender!),

                      CustomRawProfile(
                          title: AppLocalizations.of(context)!.phone_nubmer,
                          content: userInfo.phone ?? '+994 012344'),
                      CustomRawProfile(
                          title: AppLocalizations.of(context)!.birth_day,
                          content: userInfo.birthday ?? '1-1-1999'),
                      // CustomRawProfile(title: 'Language', content: 'Ar')
                      CustomChagelanguageProfile(
                        toggleLanguage: () {},
                      ),

                      verticalSpace(10)
                    ],
                  ),
                ),
              ],
            );
          }
          return DummyProfileLoadingStateWidget(size: size);
        },
      ),
    );
  }
}
