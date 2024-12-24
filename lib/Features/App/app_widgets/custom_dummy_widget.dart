import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taxi_go_user_version/Core/Utils/Assets/icons/app_icons.dart';
import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';

class CustomDummyWidget extends StatelessWidget {
  const CustomDummyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Card(
          elevation: 8,
          shadowColor: AppColors.grayColor,
          color: AppColors.whiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const Row(
            children: [
              Expanded(
                child: DummyBuildTripDetails(),
              ),
            ],
          ),
        ),
        Positioned(
          top: 5,
          right: 1,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              size: 30,
              Icons.star_rate_rounded,
              color: AppColors.yellowColor,
            ),
          ),
        )
      ],
    );
  }
}

class DummyBuildTripDetails extends StatelessWidget {
  const DummyBuildTripDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTripDetails();
  }

  Widget _buildTripDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 5.h, right: 10.w, left: 10.w),
          color: AppColors.whiteColor2,
          child: const DummyLcationRow(),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: AppColors.darkgrayColor,
        ),
        const DummyDriverdetails(
          price: '55',
          rate: '',
        ),
      ],
    );
  }
}

class DummyLcationRow extends StatelessWidget {
  const DummyLcationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DummyTripDetailsMap(
            address: 'fromAddress',
            location: 'fromCity',
            icon: AppIcons.menuIcon,
          ),
          DummyTripDetailsMap(
            address: 'toAddress',
            location: 'toCity',
            icon: AppIcons.menuIcon,
          ),
        ],
      ),
      trailing: Text(
        '',
        style: TextStyle(fontSize: 15.sp),
      ),
    );
  }
}

class DummyTripDetailsMap extends StatelessWidget {
  const DummyTripDetailsMap({
    super.key,
    required this.location,
    required this.address,
    required this.icon,
  });
  final String location;
  final String address;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        location,
        style: AppTextStyles.style16BlackW600,
      ),
      subtitle: Text(
        address,
        style: AppTextStyles.style12DarkgrayW400,
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
            width: MediaQuery.of(context).size.width * .05,
            child: SvgPicture.asset(
              icon,
            ),
          ),
        ],
      ),
    );
  }
}

class DummyDriverdetails extends StatelessWidget {
  const DummyDriverdetails(
      {super.key, required this.rate, required this.price});
  final String rate;
  final String price;

  @override
  Widget build(BuildContext context) {
    return _buildDriverDetails(context);
  }

  Widget _buildDriverDetails(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.grayColor,
        radius: 20.r,
      ),
      title: AutoSizeText(
        'Mohamed haggag',
        style: AppTextStyles.style18BlackW500,
        maxLines: 1,
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.star, size: 16, color: AppColors.amberColor),
          horizontalSpace(3),
          AutoSizeText(
            rate,
            style: AppTextStyles.style14GrayW500,
            maxLines: 1,
          ),
        ],
      ),
      trailing: _buildPrice(context),
    );
  }

  Widget _buildPrice(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          'ddd',
          style: AppTextStyles.style14DarkgrayW500,
        ),
        verticalSpace(3),
        AutoSizeText(
          'ddddd',
          style: AppTextStyles.style14BlackW500,
        ),
      ],
    );
  }
}
