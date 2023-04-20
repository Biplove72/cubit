import 'package:dio/dio.dart';
//import 'package:payment/const.dart';
import 'package:payment/models/user_response_model.dart';

class LoginRepository {
  final dio = Dio();
  Future<ResponseModel> getUserDetails(
      {required String username,
      required String amount,
      required String password,
      required String invoicenumber}) async {
    try {
      final response = await dio.post(
          'https://uatapi.paywellcorp.com/auth/api/v1/public/login-payment/',
          data: {
            'username': username,
            'password': password,
            'amount': amount,
            'invoice_number': invoicenumber,
          });
      print(response.data);
      return ResponseModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
    }
    throw 'Error';
  }
}
