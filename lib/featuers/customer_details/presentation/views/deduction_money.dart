import 'package:account_managment/featuers/customer_details/presentation/views/widgets/deduction_money_body.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:flutter/material.dart';


class DeductionMoney extends StatelessWidget {
  const DeductionMoney(
      {Key? key,
      required this.customerModel
      })
      : super(key: key);

  final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  DeductionMoneyScreenBody(
          customerModel: customerModel ,
        ),

      ),
    );
  }
}
