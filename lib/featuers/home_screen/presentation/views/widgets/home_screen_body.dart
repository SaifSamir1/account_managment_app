import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/widgets.dart';
import '../../../data/modle/customer_model.dart';
import 'list_view_item.dart';
import 'no_customers_yet.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
    required this.searchedForCharacters,
  });
  final List<CustomerModel> searchedForCharacters;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return BlocBuilder<HomeCubit, HomeStates>(
            builder: (BuildContext context, HomeStates state) {
              var homeCubit = BlocProvider.of<HomeCubit>(context);
              return ConditionalBuilder(
                  condition: state is! GetALLCustomersLoadingState,
                  builder: (context) {
                    return ConditionalBuilder(
                      condition: homeCubit.allCustomer.isNotEmpty,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              // const CustomSearchTextField(),
                              Divider(
                                color: defaultColor,
                                height: 40,
                                thickness: 2,
                              ),
                              defaultText(text: 'اسماء الزباين'),
                              Expanded(
                                child: RefreshIndicator(
                                  onRefresh: () {
                                    return homeCubit.reFresh();
                                  },
                                  child: ListView.builder(
                                      padding: const EdgeInsets.only(top: 10),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:
                                          searchTextController.text.isEmpty
                                              ? homeCubit.allCustomer.length
                                              : searchedForCharacters.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return ListViewItem(
                                          customerModel: searchTextController
                                                  .text.isEmpty
                                              ? homeCubit.allCustomer[index]
                                              : searchedForCharacters[index],
                                          index: index,
                                        );
                                      }),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kAddCustomerScreen);
                                },
                                backgroundColor: defaultColor,
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      fallback: (BuildContext context) {
                        return NoCustomersYet();
                      },
                    );
                  },
                  fallback: (context) {
                    return const Center(child: CircularProgressIndicator());
                  });
            },
          );
        } else {
          return buildNoInternetWidget();
        }
      },
      child: Center(
        child: CircularProgressIndicator(
          color: defaultColor,
        ),
      ),
    );
  }
}
