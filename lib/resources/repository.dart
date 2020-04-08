

import 'package:meetrx/model/login.dart';
import 'package:meetrx/resources/api_provider.dart';

class Respository {
  final apiProvider = ApiProvider();


  Future<LoginResponse> futureLogin(String userId,String mobileNumber,String countryId, String requestType, String numberChange) =>
      apiProvider.futureLogin(userId,mobileNumber,countryId,requestType,numberChange);
}
