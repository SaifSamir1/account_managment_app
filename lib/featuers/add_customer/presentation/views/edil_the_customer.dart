








import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/add_customer/presentation/views/widgets/edit_the_customer_body.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditCustomer extends StatelessWidget {
  const EditCustomer({Key? key,required this.customerModel}) : super(key: key);

  final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
      ),
      child: Scaffold(
        body: SafeArea(
          child: EditCustomerBody(
            customerModel: customerModel,
          ),
        ),
      ),
    );
  }
}