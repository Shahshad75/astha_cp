import 'package:astha_cp/src/network/remote/api_service.dart';
import 'package:astha_cp/utils/api_url.dart';
import 'package:astha_cp/utils/typedef.dart';

class AuthRepo {
  EitherResponse loginFnc(Map map) async =>
      ApiService.postApi(ApiUrl.baserUrl + ApiUrl.loginUrl, map);
  EitherResponse otpRequestFucn(Map map) async =>
      ApiService.postApi(ApiUrl.baserUrl + ApiUrl.otpReq, map);

    EitherResponse loginWithOtpFuc(Map map)async =>ApiService.postApi(ApiUrl.baserUrl+ApiUrl.otpLogin, map);
}
