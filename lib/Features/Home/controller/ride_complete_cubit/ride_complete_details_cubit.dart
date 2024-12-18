import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';

part 'ride_complete_details_state.dart';

class RideCompleteDetailsCubit extends Cubit<RideCompleteDetailsState> {
  RideCompleteDetailsCubit(this.rideCompleteRepoImp)
      : super(RideCompleteDetailsInitial());
  final RideCompleteRepo rideCompleteRepoImp;

  Future<void> getRideCompleteDetails(context) async {
    print("**************************${state}");
    emit(RideCompleteDetailsLoading());
    final result = await rideCompleteRepoImp.getRideCompleteDetails(context);
    result.fold((failure) {
      emit(RideCompleteDetailsFailure(failure.message));
      print("**************************${state}");
    }, (rideCompleteDetails) {
      emit(RideCompleteDetailsSuccess(rideCompleteDetails));
      print("**************************${state}");
    });
  }
}
