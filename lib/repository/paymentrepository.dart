import 'package:dio/dio.dart';
import 'package:payment/models/payment_details_model.dart';

class PaymentServices {
  final dio = Dio();
  Future<Paymentget> Paymentdetails() async {
    try {
      final response = await Dio().get(
        'https://uatapi.paywellcorp.com/auth/api/v1/public/login-payment/',
        queryParameters: {'invoice_number': 'Nfn5poQtRbZGKQZtr4kpso'},
      );
      // print(response.data);
      // print(response.data);
      final data = response.data as Map<String, dynamic>;
      final maindata = Paymentget.fromJson(data);
      print(maindata.amount);
      return Paymentget.fromJson(data);
      //final data = response.data.map((e) => Paymentget.fromJson(e)).toList();
      // print(data);
      //return data;
    } on DioError catch (e) {
      print(e);
      throw 'Error';
    }
  }
}
