// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
// import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_car_discription.dart';
// import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_confirm_booking.dart';
// import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_rating_text.dart';

// import '../../../../Core/Utils/Colors/app_colors.dart';
// import '../../../../Core/Utils/app_custom_widgets/custom_app_bottom.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class CustomBookingButtomSheet extends StatelessWidget {
//   const CustomBookingButtomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16.0.r),
//       decoration: BoxDecoration(
//         color: AppColors.ligterBlueColor,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(16.0.r),
//           topRight: Radius.circular(16.0.r),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
//             padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 width: .8.w,
//                 color: AppColors.darkgrayColor,
//               ),
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 30.r,
//                       backgroundColor: AppColors.grayColor,
//                       child: const Icon(
//                         Icons.person_sharp,
//                         color: AppColors.darkgrayColor,
//                       ),
//                     ),
//                     const CustomRatingText(),
//                     const Spacer(),
//                     const CustomCarDiscription()
//                   ],
//                 ),
//                 AutoSizeText(
//                   "far 4 km",
//                   style: AppTextStyles.style16DarkgrayW500,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: double.infinity,
//             child: CustomAppBottom(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 showModalBottomSheet(
//                   context: context,
//                   isScrollControlled: true,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16.0.r),
//                       topRight: Radius.circular(16.0.r),
//                     ),
//                   ),
//                   builder: (context) {
//                     return const CustomConfirmBooking();
//                   },
//                 );
//               },
//               buttonText: AppLocalizations.of(context)!.confirm,
//               buttonColor: AppColors.blueColor,
//               hasIcon: false,
//               textColor: AppColors.whiteColor,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
