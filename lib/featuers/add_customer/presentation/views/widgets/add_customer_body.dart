import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/core/utils/size_config.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/widgets/widgets.dart';
import 'custom_app_bar.dart';

class AddCustomerBody extends StatelessWidget {
  const AddCustomerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if (state is CreateCustomerSuccessState) {
          showFlutterToastSuccess('تمت اضافة الزبون بنجاح');
          Future.delayed(const Duration(milliseconds: 500), () {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeScreen);
          });
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
                titleOfAppBar: 'اضافة زبون',
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
                    defaultText(text: 'اسم الزبون الجديد'),
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
                    defaultText(text: 'رقم الهاتف اذا وجد'),
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
                    defaultText(text: 'الحساب الابتدائي'),
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
                            //
                            BlocProvider.of<HomeCubit>(context).createCustomer(
                              customerName: nameController.text.isEmpty ? 'غير معرف' : nameController.text,
                              phone: phoneController.text.isEmpty ? '' : phoneController.text ,
                              money:moneyController.text.isNotEmpty? int.parse(moneyController.text) : 0,
                              dateTime: DateTime.now(),
                              customerId: BlocProvider.of<HomeCubit>(context)
                                      .allCustomer
                                      .isEmpty
                                  ? 1
                                  : BlocProvider.of<HomeCubit>(context)
                                  .allCustomer.length + 1,
                            );
                          },
                          color: defaultColor,
                          height: 60,
                          minWidth: 150,
                          child: const Text(
                            'اضافه',
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
