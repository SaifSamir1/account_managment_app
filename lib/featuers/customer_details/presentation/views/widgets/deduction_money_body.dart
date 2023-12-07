import 'package:account_managment/core/utils/size_config.dart';
import 'package:account_managment/featuers/customer_details/presentation/manger/customer_details_cubit/customer_details_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../add_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../../../home_screen/data/modle/customer_model.dart';
import '../../manger/customer_details_cubit/customer_details_cubit.dart';
import '../customer_details.dart';

class DeductionMoneyScreenBody extends StatelessWidget {
  const DeductionMoneyScreenBody({super.key, required this.customerModel});

  final CustomerModel customerModel;

  @override
  Widget build(BuildContext context) {
    var productCubit = BlocProvider.of<CustomerDetailsCubit>(context);
    productCubit.getCustomerData(customerId: customerModel.id!);
    return BlocConsumer<CustomerDetailsCubit, CustomerDetailsStates>(
        listener: (BuildContext context, state) {
      if (state is CreateProductSuccessState) {
        BlocProvider.of<CustomerDetailsCubit>(context).awesomeDialog(
          context: context,
          desc: 'تمت الخصم بنجاح',
          dialogType: DialogType.success,
        );
        // isDetailsInDataBase == "true";
        // myBox!.put("isDetailsInDataBase", "true");
      }
    }, builder: (BuildContext context, Object? state) {
      TextEditingController deductionController = TextEditingController();
      TextEditingController byWhoController = TextEditingController();
      return SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar2(
              titleOfAppBar: ' خصم',
              appBarIcon: Icons.monetization_on_sharp,
              onPressed: () {
                GoRouter.of(context).pop();
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
                  defaultText(text: 'المبلغ المدفوع'),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 200,
                    child: defaultTextFormField(
                      keyboardType: TextInputType.number,
                      controller: deductionController,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  defaultText(text: 'بيد من'),
                  const SizedBox(
                    height: 5,
                  ),
                  defaultTextFormField(
                    keyboardType: TextInputType.text,
                    controller: byWhoController,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 120,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerDetails(
                                customerModel: customerModel,
                              ),
                            ),
                          );
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
                        onPressed: () async {
                          productCubit
                              .createProductAndDeduction(
                            productName: '   خصم بيد : ${byWhoController.text}   ',
                            money: deductionController.text,
                            customerId: customerModel.id!,
                            dateTime: DateTime.now(),
                          )
                              .then((value) {
                            productCubit.upDateTheMainMoney(
                              customerId:customerModel.id!,
                              money: productCubit.customerData.money! - int.parse(deductionController.text),
                            );
                          });
                          // String deduction = ' تم الخصم : ${byWhoController.text}';
                          // BlocProvider.of<CustomerDetailsCubit>(context).insertData('''
                          //   INSERT INTO 'addAndDeduction' ( 'customerId' ,'productName' , 'price' ,'date') VALUES ( $index1 ,'$deduction ' , '${deductionController.text}' , '$date' )
                          // ''').then((value) {
                          //   BlocProvider.of<CustomerDetailsCubit>(context)
                          //       .updateDataInTheMainMoney(
                          //     customerIndex: index1+1,
                          //     newAccount: customerData[index1]['money'] - int.parse(deductionController.text),
                          //   );
                          // });
                        },
                        color: defaultColor,
                        height: 60,
                        minWidth: 150,
                        child: const Text(
                          'خصم',
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
    });
  }
}
