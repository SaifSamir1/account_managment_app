import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/auth_screen_cubit/auth_screen_cubit.dart';
import '../../manger/auth_screen_cubit/auth_screen_states.dart';

class ListViewOfSheetModel extends StatelessWidget {
  const ListViewOfSheetModel({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthScreenCubit, AuthScreenStates>(
      builder: (BuildContext context, state) {
        return SizedBox(
          height: 60,
          width: double.infinity,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    BlocProvider.of<AuthScreenCubit>(context)
                        .changeIndexListView(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 190,
                    height: 45,
                    child: Center(
                        child: Column(
                      children: [
                        Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: BlocProvider.of<AuthScreenCubit>(context)
                                .changeListColor(index),
                          ),
                        ),
                        if(BlocProvider.of<AuthScreenCubit>(context).currentIndex==index)
                          const Divider(
                          height: 20,
                          color: Colors.deepOrange,
                          thickness: 2,
                          endIndent: 60,
                          indent: 60,
                        )
                      ],
                    )),
                  ),
                );
              }),
        );
      },
    );
  }
}
