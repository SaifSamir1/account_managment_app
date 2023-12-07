import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/core/utils/size_config.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/widgets/widgets.dart';
import 'custom_app_bar.dart';

class EditCustomerBody extends StatelessWidget {
  const EditCustomerBody({
    super.key,
    required this.customerModel
  });
  final CustomerModel customerModel;
  

  @override
  Widget build(BuildContext context) {
    var homeCubit = BlocProvider.of<HomeCubit>(context);
   homeCubit.getCustomerData(customerId : customerModel.id! );
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if (state is UpDateDataSuccessState) {
          showFlutterToastSuccess('تمت التعديل بنجاح');
          Future.delayed(const Duration(milliseconds: 500), () {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
          });
        }
        if(state is UpDateDataErrorState)
          {
            showFlutterToastError('حصل خطا ,برجاء المحاوله مره اخري ');
          }
      },
      builder: (BuildContext context, Object? state) {
        TextEditingController nameController = TextEditingController();
        TextEditingController phoneController = TextEditingController();
        TextEditingController moneyController = TextEditingController();
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar2(
                titleOfAppBar: 'تعديل بيانات الزبون',
                appBarIcon: Icons.person,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    defaultText(text: 'الاسم الجديد'),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultTextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultText(text: 'الرقم الجديد'),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultTextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultText(text: 'الحساب الجديد'),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: defaultTextFormField(
                        keyboardType: TextInputType.number,
                        controller: moneyController,
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          color: Colors.black26,
                          height: 60,
                          minWidth: 150,
                          child: const Text(
                            'الغاء',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize! * 6.5,
                        ),
                        MaterialButton(
                          onPressed: () {
                           homeCubit
                                .upDateCustomerDetails(
                              customerName: nameController.text.isEmpty ? homeCubit.customerData.customerName! : nameController.text,
                              phone: phoneController.text.isEmpty ? homeCubit.customerData.phone! : phoneController.text,
                              customerId: customerModel.id!,
                              money:moneyController.text.isEmpty ?  homeCubit.customerData.money! : int.parse(moneyController.text),
                              dateTime: homeCubit.customerData.dateTime!,
                            );
                          },
                          color: defaultColor,
                          height: 60,
                          minWidth: 150,
                          child: const Text(
                            'تعديل',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 130,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
