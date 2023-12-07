import 'package:account_managment/featuers/customer_details/presentation/manger/customer_details_cubit/customer_details_states.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../add_customer/presentation/views/widgets/custom_app_bar.dart';
import '../../../../home_screen/data/modle/customer_model.dart';
import '../../manger/customer_details_cubit/customer_details_cubit.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({
    super.key,
    required this.customerModel
  });

  final CustomerModel customerModel;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CustomerDetailsCubit>(context).getCustomerData(customerId: customerModel.id! ) ;
    return BlocConsumer<CustomerDetailsCubit, CustomerDetailsStates>(
      listener: (BuildContext context, state) {
        if (state is CreateProductSuccessState) {
          BlocProvider.of<CustomerDetailsCubit>(context).awesomeDialog(
            context: context,
            desc: 'تمت اضافة المنتج بنجاح',
            dialogType: DialogType.success,
          );

          // isDetailsInDataBase == "true";
          // myBox!.put("isDetailsInDataBase", "true");
        }
      },
      builder: (BuildContext context, Object? state) {
        var productCubit= BlocProvider.of<CustomerDetailsCubit>(context);
        TextEditingController priceController = TextEditingController();
        TextEditingController nameController = TextEditingController();
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar2(
                titleOfAppBar: 'اضافة منتج ',
                appBarIcon: Icons.production_quantity_limits, onPressed: () {
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
                    defaultText(text: 'سعر المنتج'),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: defaultTextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultText(text: 'اسم المنتج'),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultTextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 120,
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
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
                            productCubit.createProductAndDeduction(
                                productName: nameController.text,
                                money: priceController.text,
                                customerId:customerModel.id!,
                                dateTime: DateTime.now(),
                            ).then((value){
                              productCubit.upDateTheMainMoney(
                                  customerId: customerModel.id!,
                                  money: productCubit.customerData.money! + int.parse(priceController.text),
                              );
                            });

                            // BlocProvider.of<CustomerDetailsCubit>(context)
                            //     .insertData('''
                            //     INSERT INTO 'addAndDeduction' ( 'customerId' , 'productName' , 'price' ,'date') VALUES ('$index' , '${nameController.text}' , '${priceController.text}' , '$date' )
                            //   ''').then(
                            //   (value) {
                            //     BlocProvider.of<CustomerDetailsCubit>(context)
                            //         .updateDataInTheMainMoney(
                            //       customerIndex: index + 1,
                            //       newAccount: customerData[index]['money'] +
                            //           int.parse(priceController.text),
                            //     );
                            //   },
                            // );
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
