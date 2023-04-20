import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Cubit/payment_state.dart';
import 'package:payment/Cubit/pyament_cubit.dart';
import 'package:payment/screen/custom_row.dart';
import 'package:payment/widgets/login_widget.dart';

class DetailsPageWidget extends StatefulWidget {
  const DetailsPageWidget({super.key});

  @override
  State<DetailsPageWidget> createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<PaymentCubit>();
      cubit.fetecdata();
    });
  }

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
        child: SingleChildScrollView(
          child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
            if (state is InitialPaymnetState || state is PaymentLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              );
            } else if (state is PaymentLoded) {
              final data = state.paymentList;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 20, right: 50, bottom: 10),
                              child: Icon(Icons.watch),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'This payment will expires on',
                                    style: textTheme.bodyLarge,
                                  ),
                                ),
                                Text(data.expiryTime)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Transactions Details',
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  // CustomRow(keyText: 'Amount', value: data.amount),

                  CustomRow(keyText: 'amount', value: data.amount),

                  CustomRow(keyText: 'discount', value: data.discount),

                  CustomRow(keyText: 'Commision', value: data.commissions),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                    child: CustomRow(
                      style: textTheme.titleSmall,
                      keyText: 'PayableAmount',
                      value: data.payableAmount,
                      cardColor: Colors.grey,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child:
                        Text('Billing Details', style: textTheme.headlineSmall),
                  ),
                  CustomRow(keyText: 'ProductName', value: 'Samsung Galaxy 12'),
                  CustomRow(keyText: 'CustomerName', value: 'Pujan Basyal'),

                  MaterialButton(
                      height: 50,
                      color: Colors.red,
                      minWidth: double.infinity,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPageWidget(
                                      amount: data.amount,
                                      invoiceNumber: data.invoiceNumber,
                                    )));
                      },
                      child: Center(
                          child: Text(
                        'Continue to pay',
                        style: TextStyle(color: Colors.white),
                      )))
                ],
              );
            }
            if (state is PaymentError) {
              return Text(state.message);
            }
            return Text(state.toString());
          }),
        ),
      ),
    );
  }
}
