// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:taxi_go_user_version/Core/Utils/Routing/app_routes.dart';
// import 'package:taxi_go_user_version/Core/Utils/Spacing/app_spacing.dart';
// import 'package:taxi_go_user_version/Core/Utils/Text/text_style.dart';
// import 'package:taxi_go_user_version/Core/Utils/app_custom_widgets/custom_app_bottom.dart';
// import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/custom_BuildAdressRow.dart';
// import 'package:taxi_go_user_version/Features/Home/screens/home_widgets/payments_details.dart';
// import 'package:taxi_go_user_version/Features/Map/Data/model/get_last_ride/get_last_ride.dart';

// class PaymentScreen extends StatelessWidget {
//   final GetLastRide getLastRide;
//   const PaymentScreen({
//     super.key,
//     required this.getLastRide,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pushNamed(AppRoutes.cancelbooing);
//           },
//         ),
//         title: AutoSizeText(
//           'Payment',
//           style: AppTextStyles.style18BlackW500,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(
//           horizontal: size.width * 0.05.h,
//           //  vertical: size.height * 0.02.w,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Location section
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       BuildAddressRow(
//                         fromAddress: getLastRide.data!.addressFrom!,
//                         fromLoccation: '',
//                         toAddress: getLastRide.data!.addressFrom!,
//                         toLocation: '',
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             PaymentsDetails(size: size, rideDetails: getLastRide),

//             verticalSpace(10),

//             CustomAppBottom(
//                 buttonText: AppLocalizations.of(context)!.confirm,
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(AppRoutes.rate);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
