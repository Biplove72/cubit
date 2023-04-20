import 'package:payment/models/user_response_model.dart';

abstract class LoginState {}

class InitailLogintate extends LoginState {}

class ResponseLoadingLogin extends LoginState {}

class ResponseState extends LoginState {
  final ResponseModel usermodel;
  ResponseState(this.usermodel);
}

class ErrorLoginState extends LoginState {
  final String message;
  ErrorLoginState(this.message);
}
