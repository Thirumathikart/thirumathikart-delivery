



import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:thirumathikart_delivery/constants/api_constants.dart';
import 'package:thirumathikart_delivery/models/fetch_order_response.dart';
import 'package:thirumathikart_delivery/models/login_request.dart';
import 'package:thirumathikart_delivery/models/login_response.dart';
import 'package:thirumathikart_delivery/models/register_request.dart';
import 'package:thirumathikart_delivery/models/register_response.dart';
import 'package:thirumathikart_delivery/services/storage_service.dart';


class ApiServices extends GetxService {
  late ApiManager api;

  Future<ApiServices> initApi() async {
    api = ApiManager();
    return this;
  }
}

class ApiManager extends GetConnect {
  final headers = {
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
  };

  

  Future<LoginResponse> loginCutomer(
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
            await storageServices.storeUser(loginResponse.token);
            return loginResponse;
          }
        }
        return Future.error('Unable To Login User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<RegistrationResponse> registerCutomer(
      RegistrationRequest request) async {
    try {
      final response = await post(
          ApiConstants.register, registrationRequestToJson(request),
          headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var registerResponse =
              registrationResponseFromJson(response.bodyString!);
          return registerResponse;
        }
        return Future.error('Unable To Register User');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
  Future<FetchOrderResponse> fetchOrder(StorageServices storageServices) async {
    try {
      var jwt = storageServices.getUser();
      var headers = {
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': jwt!
      };
      final response = await get(ApiConstants.fetchProduct, headers: headers);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200 && response.bodyString != null) {
          var fetchOrderResponses =
              fetchOrderResponseFromJson(response.bodyString!);
          return fetchOrderResponses;
        }
        return Future.error('Unable To Fetch Product');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

    Future<void> forgotPassword(String email) async {
    try {
      final response = await post(ApiConstants.forgotPassword, {'email': email}, headers: headers);

      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        if (response.statusCode == 200) {
          // Success
          return;
        }
        return Future.error('Failed to initiate password reset');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

}
