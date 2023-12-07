import 'package:account_managment/featuers/add_customer/presentation/views/widgets/custom_app_bar.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../data/modle/customer_model.dart';

class MoneyOfAllTheCustomersBody extends StatelessWidget {
  const MoneyOfAllTheCustomersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getAllCustomer();
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        return Column(
          children: <Widget>[
            CustomAppBar2(
              titleOfAppBar: 'المبلغ الكلي لليوم',
              appBarIcon: Icons.money,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const Expanded(flex: 1, child: SizedBox()),
            defaultText(text: ': الحساب الكلي '),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${allMoney(
                allCustomers:BlocProvider.of<HomeCubit>(context).allCustomer ,
              )}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        );
      },
    );
  }
}

int allMoney({required List<CustomerModel> allCustomers}) {
  int sum = 0;
  for (int i = 0; i < allCustomers.length; i++) {
    sum = sum + allCustomers[i].money!;
  }
  return sum;
}
