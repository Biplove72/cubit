import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Cubit/login_cubit.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget(
      {super.key, required this.amount, required this.invoiceNumber});
  final String invoiceNumber;
  final String amount;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              MaterialButton(
                  onPressed: () {
                    context.read<LoginCubit>().postlogin(
                        username: username.text,
                        password: password.text,
                        amount: widget.amount,
                        invoiceNumber: widget.invoiceNumber);
                  },
                  child: Text('getPaymentDetails')),
            ],
          ),
        ),
      ),
    );
  }
}
