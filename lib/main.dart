import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Cubit/login_cubit.dart';
import 'package:payment/Cubit/pyament_cubit.dart';
import 'package:payment/repository/login_repository.dart';
import 'package:payment/repository/paymentrepository.dart';
import 'package:payment/screen/payment_detailsPage.dart';
//import 'package:payment/widgets/login_widget.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => PaymentCubit(PaymentServices())),
        BlocProvider(
            create: (BuildContext context) => LoginCubit(LoginRepository())),
      ],
      child: MaterialApp(home: DetailsPageWidget()),
    );
  }
}
