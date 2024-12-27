// import 'package:flutter_bloc/flutter_bloc.dart';
//
// Future<void> sendCancellationReason(state) async {
//   final selectedReasonText = reasons[_selectedReason - 1];
//
//   print("Selected Reason: $selectedReasonText");
//   BlocProvider.of<RateCancelCubit>(context)
//       .confirmCancel(context, selectedReasonText);
//   if (state is CancelSuccess) {
//     if (state.status == true) {
//       // Navigator.pushReplacementNamed(context, AppRoutes.generalScreen);
//       print("Success");
//     } else if (state is CancelError) {
//       print(state.status);
//     }
//   }
// }
