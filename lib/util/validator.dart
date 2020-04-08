import 'dart:async';

import 'dart:math';

mixin Validator {
  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Invalid email");
    }
  });

  var mobileNumberValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 10) {
      sink.add(password);
    } else {
      sink.addError("Invalid mobile number");
    }
  });
}
