import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: ()
              {
              },
              icon: const Icon(Icons.format_list_bulleted_rounded),
            ),
            const SizedBox(width: 75,),
            Icon(Icons.location_on, color: defaultColor, size: 30),
            const SizedBox(
              width: 5,
            ),
            Text(
              '${BlocProvider.of<HomeCubit>(context).userModel.countryName}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        );
      },
    );
  }
}
