




import 'package:flutter/material.dart';

import 'money_of_all_the_customers_body.dart';

class MoneyOfAllTheCustomers extends StatelessWidget {
  const MoneyOfAllTheCustomers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SafeArea(child: MoneyOfAllTheCustomersBody()) ,
    );
  }
}
