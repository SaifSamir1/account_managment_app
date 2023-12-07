import 'package:account_managment/featuers/customer_details/presentation/views/widgets/add_product_body.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key,required this.customerModel})
      : super(key: key);

  final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: AddProductBody(
          customerModel: customerModel,
        ),
      ),
    );
  }
}
