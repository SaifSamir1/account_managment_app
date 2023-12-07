import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/widgets/widgets.dart';
import 'package:account_managment/featuers/customer_details/presentation/manger/customer_details_cubit/customer_details_states.dart';
import 'package:account_managment/featuers/customer_details/presentation/views/add_product.dart';
import 'package:account_managment/featuers/customer_details/presentation/views/deduction_money.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../add_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../manger/customer_details_cubit/customer_details_cubit.dart';
import 'details_list_view_item.dart';

class CustomerDetailsBody extends StatelessWidget {
  const CustomerDetailsBody({
    required this.customerModel,
    super.key,
  });

  final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomerDetailsCubit>(context).getCustomerData(customerId: customerModel.id!);
    return BlocConsumer<CustomerDetailsCubit, CustomerDetailsStates>(
      listener: (context ,state) {},
      builder: (BuildContext context, Object? state) {
        BlocProvider.of<CustomerDetailsCubit>(context).getAllProducts(customerId: customerModel.id!);
        var customerCubit = BlocProvider.of<CustomerDetailsCubit>(context);
        return ConditionalBuilder(
          condition: state is! GetCustomerDataLoadingState && state is! GetALLProductLoadingState && customerCubit.customerData != {},
          builder: (context) {
            return ConditionalBuilder(
              condition: customerCubit.allProduct.isNotEmpty,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    CustomAppBar2(
                      titleOfAppBar: '${customerCubit.customerData.customerName}',
                      appBarIcon: Icons.person, onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
                    },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultText(text: ': الحساب النهائي '),
                    Text(
                      '${customerCubit.customerData.money}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                      child: defaultText(text: ': تفاصيل الحساب -'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: customerCubit.allProduct.length,
                          itemBuilder: (context, index) {
                            return DetailsBodyListViewItem(
                              index1: index,
                              productData: customerCubit.allProduct,
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeductionMoney(
                                        customerModel: customerModel,
                                      )));
                            },
                            color: defaultColor,
                            height: 60,
                            minWidth: 150,
                            child: const Text(
                              'خصم من الحساب',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.defaultSize! * 6.5,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddProduct(
                                        customerModel: customerModel,
                                      )));
                            },
                            color: defaultColor,
                            height: 60,
                            minWidth: 150,
                            child: const Text(
                              'اضافه منتج',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              fallback: (BuildContext context) {
                return Column(
                  children: [
                    CustomAppBar2(
                      titleOfAppBar: '${customerCubit.customerData.customerName}',
                      appBarIcon: Icons.person, onPressed: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
                    },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultText(text: ': الحساب النهائي '),
                    Text(
                      '${customerCubit.customerData.money}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                      child: defaultText(text: ': تفاصيل الحساب -'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'لا يوجد اي تفاصيل للحساب ',
                          style: TextStyle(
                            fontSize: 15,
                            color: defaultColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  DeductionMoney(
                                        customerModel: customerModel,
                                      )));
                            },
                            color: defaultColor,
                            height: 60,
                            minWidth: 150,
                            child: const Text(
                              'خصم من الحساب',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.defaultSize! * 6.5,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddProduct(
                                        customerModel: customerModel,
                                      )));
                            },
                            color: defaultColor,
                            height: 60,
                            minWidth: 150,
                            child: const Text(
                              'اضافه منتج',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );

              },
            );
          },
          fallback: (context)
          {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
