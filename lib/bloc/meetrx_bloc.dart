import 'dart:async';

import 'package:meetrx/model/login.dart';
import 'package:meetrx/resources/repository.dart';
import 'package:meetrx/util/validator.dart';
import 'package:rxdart/subjects.dart';

class MeetRxBlock extends Object with Validator {
  final _repository = Respository();
  final _mobileNumberController = BehaviorSubject<String>();

  Stream<String> get mobileNumber =>
      _mobileNumberController.stream.transform(mobileNumberValidator);

  StreamSink<String> get mobileNumberChanged => _mobileNumberController.sink;

  Future<LoginResponse> login(String userId, String mobileNumber,
      String countryId, String requestType, String numberChange) async {
    LoginResponse loginResponse = await _repository.futureLogin(
        userId, mobileNumber, countryId, requestType, numberChange);
    return loginResponse;
  }

  dispose() {}
}

final bloc = MeetRxBlock();
