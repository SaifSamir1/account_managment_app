



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/size_config.dart';
import '../../manger/auth_screen_cubit/auth_screen_cubit.dart';
import '../../manger/auth_screen_cubit/auth_screen_states.dart';
import 'list_view_of_sheet_model.dart';

class BuildSheet extends StatelessWidget {
   const BuildSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<AuthScreenCubit,AuthScreenStates>(
      builder: (BuildContext context, state) {
        return SizedBox(
          height: SizeConfig.defaultSize! * 60.7,
          child: SingleChildScrollView(
            child: Column(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.horizontal_rule),padding: EdgeInsets.zero,),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      ListViewOfSheetModel(items: BlocProvider.of<AuthScreenCubit>(context).itemsOfAuth),
                      BlocProvider.of<AuthScreenCubit>(context).listScreen[BlocProvider.of<AuthScreenCubit>(context).currentIndex],
                    ],
                  ),
                ),
              ],
            ),
          ) ,
        );
      },
    );
  }
}



