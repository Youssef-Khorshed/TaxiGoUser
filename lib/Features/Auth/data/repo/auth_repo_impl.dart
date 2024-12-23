import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Auth/data/models/get_cities_model/GetCitiesModel.dart';
import 'package:taxi_go_user_version/Features/Auth/data/models/get_districts_by_cities/GetDistrictsByCities.dart';
import 'package:taxi_go_user_version/Features/Auth/data/models/log_out/Log_out_model.dart';

import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../../../../Core/Utils/Network/Services/apiservices.dart';

import '../../../../Core/Utils/Network/Services/secure_token.dart';
import '../models/create_profile_model/create_profile_model.dart';
import '../models/forget_password_model/Forget_password_model.dart';
import '../models/login_model/LoginModel.dart';

import '../models/login_model/set_password_model.dart';
import '../models/send_verification_code_model/send_verification_code_model.dart';
import '../models/set_password_model/SendPasswordModel.dart';
import '../models/sign_up_model/Data.dart';
import '../models/sign_up_model/Register_model.dart';
import '../models/verify_account/verify_account.dart';
import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String phone,
      required String password,
      required BuildContext context}) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.login,
          body: {"identifier": phone, "password": password},
          context: context);
      return Right(LoginModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setPassword(
      {required String password,
      required String passwordConfirmation,
      required BuildContext context}) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.setPassword,
          body: {
            "password": password,
            "password_confirmation": passwordConfirmation
          },
          context: context);
      return Right(SetPasswordModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  Future<Either<Failure, SendVerificationCodeModel>> sendVerificationCode(
      BuildContext context) async {
    try {
      await apiService.getDio(context);
      var response = await apiService.getRequest(
          Constants.baseUrl + Constants.sendVerification,
          context: context);
      SendVerificationCodeModel data =
          SendVerificationCodeModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, VerifyAccount>> verifyAccount(
      BuildContext context, int otp) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.verifyAccount,
          body: {"code": otp},
          context: context);
      print("respondse ${response}");
      if (response["status"] == false) {
        return Left(ServerFailure(message: response["message"]));
      }
      else
      {  VerifyAccount data = VerifyAccount.fromJson(response);
      return Right(data);}

    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, SendPasswordModel>> setRegisterPassword(
      BuildContext context, Map<String, dynamic> body) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.verifyAccount,
          body: body,
          context: context);
      if (response["status"] == false) {
        return Left(ServerFailure(message: response["message"]));
      }
      else{
      SendPasswordModel data = SendPasswordModel.fromJson(response);
      return Right(data);}
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      BuildContext context, String phone) async {
    try {
      var response = await apiService.getRequest(
          Constants.baseUrl + Constants.forgotPassword,
          queryParameters: {"identifier": phone},
          context: context);
      if(response["status"] == false){
        return Left(ServerFailure(message: response["message"]));

      }
      else{ ForgetPasswordModel data = ForgetPasswordModel.fromJson(response);
      return Right(data);}

    } catch (e) {
      if (e is DioException) {

        return Left(ServerFailure(
          message: e.response!.data.toString(),
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, SendVerificationCodeModel>> forgotPasswordCheckCode(
      BuildContext context,
      {int? otp,
      String? phone}) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.forgotPasswordCheckCode,
          body: {"identifier": phone, "code": otp},
          context: context);
      if(response["status"] == false){
        return Left(ServerFailure(message: response["message"]));

      }
    else{
        SendVerificationCodeModel data =
        SendVerificationCodeModel.fromJson(response);
        return Right(data);
    }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, RegisterDataModel>> signUp(
      {required String name,
      required String phone,
      required String gender,
      required BuildContext context}) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.register,
          body: {"name": name, "phone": phone, "gender": gender},
          context: context);
      print(response);
      if(response["status"] == false){
        return Left(ServerFailure(message: response["message"]));

      }
     else{
        RegisterModel dataModel = RegisterModel.fromJson(response);
        if (dataModel.data?.token != null) {
          print("LOL${dataModel.data?.token}");

        }
        await SecureToken.addToken(dataModel.data!.token!);
        return Right(dataModel.data ?? RegisterDataModel());
     }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(
          message: e.response!.data["message"],
        ));
      } else {
        return Left(ServerFailure(
          message: e.toString(),
        ));
      }
    }
  }

//Create Profile
  @override
  Future<Either<Failure, GetCitiesModel>> getCities(
      BuildContext context) async {
    try {
      var response = await apiService
          .getRequest(Constants.baseUrl + Constants.cities, context: context);
      GetCitiesModel data = GetCitiesModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(message: e.response!.data["message"]));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, GetDistrictsByCitiesModel>> getDistricts(
      BuildContext context, int cityId) async {
    try {
      var response = await apiService.getRequest(
          Constants.baseUrl + Constants.districts,
          context: context,
          queryParameters: {"city_id": cityId});
      GetDistrictsByCitiesModel data =
          GetDistrictsByCitiesModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(message: e.response!.data["message"]));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, CreateProfileModel>> createProfile(
      BuildContext context, FormData formData) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.createProfile,
          context: context,
          body: formData);
      CreateProfileModel data = CreateProfileModel.fromJson(response);
      return Right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure(message: e?.response?.data["message"]));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setNewPassword(
      {required String passwordConfirmation,
      required String password,
      required String phone,
      required BuildContext context}) async {
    try {
      var response = await apiService.postRequest(
          Constants.baseUrl + Constants.setPassword,
          body: {
            "password": password,
            "password_confirmation": passwordConfirmation,
            "identifier": phone
          },
          context: context);
      return Right(SetPasswordModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, LogOutModel>> logout(BuildContext context) async {
    try {
      var response = await apiService
          .postRequest(Constants.baseUrl + Constants.logout, context: context);
      return Right(LogOutModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(message: e.toString()));
      }
    }
  }
}
