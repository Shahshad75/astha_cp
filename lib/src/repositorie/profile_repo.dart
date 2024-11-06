import 'package:astha_cp/src/network/remote/api_service.dart';
import 'package:astha_cp/utils/api_url.dart';
import 'package:astha_cp/utils/typedef.dart';

class ProfileRepo {
  EitherResponse getProfileData(String token) async =>
      ApiService.getApi(ApiUrl.baserUrl + ApiUrl.getProfile, token);
}
