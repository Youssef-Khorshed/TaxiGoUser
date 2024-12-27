import 'package:taxi_go_user_version/Core/Utils/Network/Services/secure_storage_helper.dart';
import 'package:taxi_go_user_version/Core/app_constants.dart';

abstract class SecureProfile {
  static SecureStorageHelper secureStorageHelper = SecureStorageHelper();

  static addProfileImage(String image) async {
    await secureStorageHelper.writeValue(AppConstants.kProfileImage, image);
  }

  static Future<String?> getProfileImage() async {
    return await secureStorageHelper.readValue(AppConstants.kProfileImage);
  }

  static deleteProfileImage() async {
    await secureStorageHelper.deleteValue(AppConstants.kProfileImage);
  }

  static addProfileName(String name) async {
    await secureStorageHelper.writeValue(AppConstants.kName, name);
  }

  static Future<String?> getProfileName() async {
    return await secureStorageHelper.readValue(AppConstants.kName);
  }

  static deleteProfileName() async {
    await secureStorageHelper.deleteValue(AppConstants.kName);
  }

  static addLanguage(String language) async {
    await secureStorageHelper.writeValue(AppConstants.kLanguage, language);
  }

  static Future<String?> getLanguage() async {
    return await secureStorageHelper.readValue(AppConstants.kLanguage);
  }
}
