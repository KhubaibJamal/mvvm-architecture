import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  // login Api
  Future<void> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // register
  Future<void> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
