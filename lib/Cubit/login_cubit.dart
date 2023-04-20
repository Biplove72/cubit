import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Cubit/login_state.dart';
import 'package:payment/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginrepo;
  LoginCubit(this.loginrepo) : super(InitailLogintate());
  // final dio = Dio();
  Future<void> postlogin(
      {required String username,
      required String password,
      required String amount,
      required String invoiceNumber}) async {
    emit(ResponseLoadingLogin());

    try {
      final response = await loginrepo.getUserDetails(
          username: username,
          password: password,
          amount: amount,
          invoicenumber: invoiceNumber);

      print('Login request successful: $response');

      emit(ResponseState(response));
    } on DioError catch (e) {
      emit(ErrorLoginState(e.message.toString()));
    }
  }
}
