import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_profile.dart';

import '../../../data/models/create_profile_model/create_profile_model.dart';
import '../../../data/models/get_cities_model/GetCitiesModel.dart';
import '../../../data/models/get_districts_by_cities/GetDistrictsModel.dart';
import '../../../data/repo/auth_repo.dart';

part 'create_profile_state.dart';

class CreateProfileCubit extends Cubit<CreateProfileState> {
  CreateProfileCubit(this.authRepo) : super(CreateProfileInitial());
  GetCitiesModel? getCitiesModel;
  GetDistrictsModel? directionModel;
  AuthRepo authRepo;
  String? selectedCityId;
  String? selectedDistrictId;
  TextEditingController emailController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  AutovalidateMode? autovalidateMode;

  GlobalKey<FormState>? formKey = GlobalKey<FormState>();
  static CreateProfileCubit get(context) => BlocProvider.of(context);
  Future<void> getCities(BuildContext context) async {
    emit(GetCitiesLoading());
    var result = await authRepo.getCities(context);

    result.fold((failure) => emit(GetCitiesFailure(error: failure.message)),
        (response) {
      getCitiesModel = response;
      emit(GetCitiesSuccess(getCitiesModel: response));
    });
  }

  Future<void> getDistricts(BuildContext context, int cityId) async {
    emit(GetDistrictsLoading());
    var result = await authRepo.getDistricts(context, cityId);
    result.fold((failure) => emit(GetCitiesFailure(error: failure.message)),
        (response) {
      directionModel = response;
      selectedCityId = cityId.toString();
      emit(GetDistrictsSuccess(districts: response));
    });
  }

  Future<void> createProfile(BuildContext context, FormData formData) async {
    emit(CreateProfileLoading());
    var result = await authRepo.createProfile(context, formData);
    result.fold((failure) => emit(GetCitiesFailure(error: failure.message)),
        (response) async {
      await SecureProfile.addProfileImage(response.data?.user?.picture ?? "");
      await SecureProfile.addProfileName(response.data!.user!.name!);
      emit(CreateProfileSuccess(response: response));
    });
  }

  Future<void> createProfileValidate(
      BuildContext context, File? imageFile) async {
    FormData formData = FormData.fromMap({
      "email": emailController.text,
      if (imageFile != null)
        "picture": await MultipartFile.fromFile(imageFile.path),
      "address": streetController.text,
      "city_id": selectedCityId,
      "district_id": selectedDistrictId,
    });
    if (formKey!.currentState!.validate()) {
      formKey!.currentState!.save();
      createProfile(context, formData);
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
