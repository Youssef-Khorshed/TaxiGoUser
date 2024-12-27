// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import 'package:taxi_go_user_version/Core/Utils/Colors/app_colors.dart';
// import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
// import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_chage_language_profile.dart';
// import 'package:taxi_go_user_version/Features/Profile/profile_widgets/custom_raw_profile.dart';
//
// class DummyProfileLoadingStateWidget extends StatelessWidget {
//   const DummyProfileLoadingStateWidget({
//     super.key,
//     required this.size,
//   });
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           verticalSpace(size.height * 0.15),
//           Container(
//             width: size.width * 0.3,
//             height: size.width * 0.3,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//             ),
//           ),
//           const Spacer(),
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(size.width * 0.05),
//             decoration: const BoxDecoration(
//               color: AppColors.whiteColor,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomRawProfile(title: 'Name', content: 'Mohamed'),
//                 CustomRawProfile(title: 'Gender', content: 'Male'),
//                 CustomRawProfile(title: 'Email', content: 'Mohamed@gmail.com'),
//                 CustomRawProfile(title: 'Phone', content: '+994 012344'),
//                 CustomRawProfile(title: 'BirthDate', content: '1-1-1999'),
//                 // CustomRawProfile(title: 'Language', content: 'Ar')
//                 const CustomChagelanguageProfile(),
//
//                 verticalSpace(10)
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
