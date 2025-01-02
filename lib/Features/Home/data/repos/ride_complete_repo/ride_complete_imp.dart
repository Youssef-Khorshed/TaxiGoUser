import 'package:dartz/dartz.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Error/failure.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/apiservices.dart';
import 'package:taxi_go_user_version/Features/Home/data/models/ride_complete_model/ride_complete_details_model.dart';
import 'package:taxi_go_user_version/Features/Home/data/repos/ride_complete_repo/ride_complete.dart';

class RideCompleteRepoImpl implements RideCompleteRepo {
  final ApiService apiService;

  RideCompleteRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, RideCompleteDetailsModel>> getRideCompleteDetails(
      context) async {
    final response =
        await apiService.getRequest(context: context, Constants.completeRide);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        RideCompleteDetailsModel rideDetails =
            RideCompleteDetailsModel.fromJson(ifRight.data["data"]);
        return Right(
          RideCompleteDetailsModel.fromJson(rideDetails.toJson()),
        );
      }
    });
  }
}
