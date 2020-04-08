import 'dart:convert';

import 'package:http/http.dart';
import 'package:meetrx/model/login.dart';

class ApiProvider {
  Client client = Client();
  final _api_key = '';

  Future<LoginResponse> futureLogin(String userId, String mobileNumber,
      countryId, requestType, numberChange) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    Map<String, String> body = {
      "UserId": userId.trim(),
      "RequestType": requestType.trim(),
      "CountryCode": countryId.trim(),
      "MobileNo": mobileNumber.trim(),
      "numberChange": numberChange.trim()
    };
    // make POST request
    Response response = await post('https://api.com/api/loginService',
        headers: headers, body: json.encode(body));

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
