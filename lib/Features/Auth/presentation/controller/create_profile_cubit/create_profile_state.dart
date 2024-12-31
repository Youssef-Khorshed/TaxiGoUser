part of 'create_profile_cubit.dart';

@immutable
sealed class CreateProfileState {}

final class CreateProfileInitial extends CreateProfileState {}

//get cities
// ignore: must_be_immutable
final class GetCitiesSuccess extends CreateProfileState {
  GetCitiesModel? getCitiesModel;
  GetCitiesSuccess({this.getCitiesModel});
}

// ignore: must_be_immutable
final class GetCitiesFailure extends CreateProfileState {
  String? error;
  GetCitiesFailure({this.error});
}

final class GetCitiesLoading extends CreateProfileState {}

//get districts
// ignore: must_be_immutable
final class GetDistrictsSuccess extends CreateProfileState {
  GetDistrictsModel? districts;
  GetDistrictsSuccess({this.districts});
}

// ignore: must_be_immutable
final class GetDistrictsFailure extends CreateProfileState {
  String? error;
  GetDistrictsFailure({this.error});
}

final class GetDistrictsLoading extends CreateProfileState {}

//create profile
// ignore: must_be_immutable
final class CreateProfileSuccess extends CreateProfileState {
  CreateProfileModel response;
  CreateProfileSuccess({required this.response});
}

// ignore: must_be_immutable
final class CreateProfileFailure extends CreateProfileState {
  String? error;
  CreateProfileFailure({this.error});
}

final class CreateProfileLoading extends CreateProfileState {}
