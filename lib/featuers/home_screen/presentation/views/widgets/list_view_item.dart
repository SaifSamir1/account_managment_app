import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../add_customer/presentation/views/edil_the_customer.dart';
import '../../../../customer_details/presentation/views/customer_details.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    required this.index,
    required this.customerModel,
    super.key,
  });

  final CustomerModel customerModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (BuildContext context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CustomerDetails(
                  customerModel: customerModel,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditCustomer(
                              customerModel: customerModel,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    // FutureBuilder(
                    //   future: BlocProvider.of<HomeCubit>(context).readData(),
                    //   builder: (BuildContext context,
                    //       AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Text(
                    //         '${snapshot.data![index]['money']}',
                    //         style: const TextStyle(fontSize: 20),
                    //       );
                    //     } else {
                    //       return const Center(child: CircularProgressIndicator());
                    //     }
                    //   },
                    // ),
                    Text(
                      '${customerModel.money}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(),
                    Text(
                      '${customerModel.customerName}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      ' - ${index + 1}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 190.0),
                  child: Text(
                    '${customerModel.phone}',
                    style: const TextStyle(color: Color(0xff6B7280)),
                  ),
                ),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}
