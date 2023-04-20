import 'package:payment/models/payment_details_model.dart';

abstract class PaymentState {}

class InitialPaymnetState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentLoded extends PaymentState {
  final Paymentget paymentList;
  PaymentLoded(this.paymentList);
}

class PaymentError extends PaymentState {
  final String message;
  PaymentError(this.message);
}
