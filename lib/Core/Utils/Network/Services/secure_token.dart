import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_storage_helper.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';

abstract class SecureToken {
 static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
static  addToken(String token) async {
    await secureStorageHelper.writeValue(AppConstants.kToken, token);
  }

 static Future<String?> getToken() async {
 return   await secureStorageHelper.readValue(AppConstants.kToken);
  }

static   deleteToken() async {
    await secureStorageHelper.deleteValue(AppConstants.kToken);

  }
}
