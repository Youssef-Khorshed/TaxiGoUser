import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxi_go_user_version/Features/Auth/data/models/get_cities_model/GetCitiesModel.dart';
import 'package:taxi_go_user_version/Features/Auth/data/models/log_out/Log_out_model.dart';
import '../../../../Core/Utils/Network/Error/failure.dart';
import '../../../../Core/Utils/Network/Services/api_constant.dart';
import '../../../../Core/Utils/Network/Services/apiservices.dart';
import '../../../../Core/Utils/Network/Services/secure_token.dart';
import '../models/create_profile_model/create_profile_model.dart';
import '../models/forget_password_model/Forget_password_model.dart';
import '../models/get_districts_by_cities/GetDistrictsModel.dart';
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
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.login,
        body: {"identifier": phone, "password": password},
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(LoginModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setPassword(
      {required String password,
      required String passwordConfirmation,
      required BuildContext context}) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.setPassword,
        body: {
          "password": password,
          "password_confirmation": passwordConfirmation
        },
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SetPasswordModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, SendVerificationCodeModel>> sendVerificationCode(
      BuildContext context) async {
    var response = await apiService.getRequest(
        Constants.baseUrl + Constants.sendVerification,
        context: context);
    return response.fold((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }, (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SendVerificationCodeModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, VerifyAccount>> verifyAccount(
      BuildContext context, int otp) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.verifyAccount,
        body: {"code": otp},
        context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(VerifyAccount.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, SendPasswordModel>> setRegisterPassword(
      BuildContext context, Map<String, dynamic> body) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.verifyAccount,
        body: body,
        context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SendPasswordModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, ForgetPasswordModel>> forgetPassword(
      BuildContext context, String phone) async {
    var response = await apiService.getRequest(
        Constants.baseUrl + Constants.forgotPassword,
        queryParameters: {"identifier": phone},
        context: context);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(ForgetPasswordModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, SendVerificationCodeModel>> forgotPasswordCheckCode(
      BuildContext context,
      {int? otp,
      String? phone}) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.forgotPasswordCheckCode,
        body: {"identifier": phone, "code": otp},
        context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SendVerificationCodeModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, RegisterDataModel>> signUp(
      {required String name,
      required String phone,
      required String gender,
      required BuildContext context}) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.register,
        body: {"name": name, "phone": phone, "gender": gender},
        context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        RegisterModel dataModel = RegisterModel.fromJson(ifRight.data);
        if (dataModel.data?.token != null) {
          return SecureToken.addToken(dataModel.data!.token!).then((onValue) {
            return Right(RegisterDataModel.fromJson(ifRight.data));
          });
        } else {
          return Left(ServerFailure(message: 'Token not Found'));
        }
      }
    });
  }

//Create Profile
  @override
  Future<Either<Failure, GetCitiesModel>> getCities(
      BuildContext context) async {
    var response = await apiService
        .getRequest(Constants.baseUrl + Constants.cities, context: context);

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetCitiesModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, GetDistrictsModel>> getDistricts(
      BuildContext context, int cityId) async {
    var response = await apiService.getRequest(
        Constants.baseUrl + Constants.districts,
        context: context,
        queryParameters: {"city_id": cityId});

    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(GetDistrictsModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, CreateProfileModel>> createProfile(
      BuildContext context, FormData formData) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.createProfile,
        context: context,
        body: formData);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(CreateProfileModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, SetPasswordModel>> setNewPassword(
      {required String passwordConfirmation,
      required String password,
      required String phone,
      required BuildContext context}) async {
    var response = await apiService.postRequest(
        Constants.baseUrl + Constants.forgotPasswordSet,
        body: {
          "password": password,
          "password_confirmation": passwordConfirmation,
          "identifier": phone
        },
        context: context);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(SetPasswordModel.fromJson(ifRight.data));
      }
    });
  }

  @override
  Future<Either<Failure, LogOutModel>> logout(BuildContext context) async {
    var response = await apiService
        .postRequest(Constants.baseUrl + Constants.logout, context: context);
    return response.fold(((ifLeft) {
      return Left(ServerFailure(message: ifLeft));
    }), (ifRight) {
      if (ifRight.data["status"] == false) {
        return Left(ServerFailure(message: ifRight.data["message"]));
      } else {
        return Right(LogOutModel.fromJson(ifRight.data));
      }
    });
  }
}
