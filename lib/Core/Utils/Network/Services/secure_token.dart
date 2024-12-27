import 'package:taxi_go_user_version/Core/Utils/Network/Services/api_constant.dart';
import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_storage_helper.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';

abstract class SecureToken {
  static SecureStorageHelper secureStorageHelper = SecureStorageHelper();
  static addToken(String token) async {
    var ktoken =
        await secureStorageHelper.writeValue(AppConstants.kToken, token);
  }

  static Future<String?> getToken() async {
    var token = await secureStorageHelper.readValue(AppConstants.kToken);
    return token;
  }

  static deleteToken() async {
    await secureStorageHelper.deleteValue(Constants.kToken);
  }
}
