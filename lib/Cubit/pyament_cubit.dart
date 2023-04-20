import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Cubit/payment_state.dart';
import 'package:payment/repository/paymentrepository.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentServices _services;
  PaymentCubit(this._services) : super(InitialPaymnetState());

  Future<void> fetecdata() async {
    emit(PaymentLoadingState());
    try {
      final response = await _services.Paymentdetails();
      emit(PaymentLoded(response));
    } catch (e) {
      emit(PaymentError(e.toString()));
    }
  }
}
