







import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/add_customer/presentation/views/widgets/add_customer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCustomer extends StatelessWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: defaultColor,
      ),
      child: const Scaffold(
        body: SafeArea(
          child: AddCustomerBody(),
        ),
      ),
    );
  }
}

