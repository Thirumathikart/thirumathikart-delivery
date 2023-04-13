import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_delivery/models/login_request.dart';
import 'package:thirumathikart_delivery/models/login_response.dart';
import 'package:thirumathikart_delivery/services/storage_service.dart';
import 'package:thirumathikart_delivery/constants/api_constants.dart';
class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  @override
  void onInit() {
    httpClient.timeout = const Duration(seconds: 10);
  }

  var headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };

  Future<LoginResponse> loginDelivery(
      LoginRequest request, StorageServices storageServices) async {
    try {
      final response =
          await post(ApiConstants.login, request.toJson(), headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var loginResponse = loginResponseFromJson(response.bodyString!);
          if (loginResponse.message == 'User Authenticated Successfully') {
            storageServices.storeJWT(loginResponse.token);
            return loginResponse;
          }
        }
        return Future.error('Unable To Login User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
