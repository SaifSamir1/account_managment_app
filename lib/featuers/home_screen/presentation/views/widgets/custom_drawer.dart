import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/constant.dart';
import '../../manger/home_cubit/home_cubit.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: defaultColor),
            accountName:
                Text('${BlocProvider.of<HomeCubit>(context).userModel.name}'),
            accountEmail:
                Text('${BlocProvider.of<HomeCubit>(context).userModel.email}'),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            title: const Text('الحساب النهائي لجميع الزبائن'),
            leading: const Icon(Icons.money),
            onTap: ()
            {
              GoRouter.of(context).push(AppRouter.kAllMoneyScreen
              );
            },
          ),
          const SizedBox(
            height: 350,
          ),
          defaultButton(
              onPressedFunction: (){
                BlocProvider.of<HomeCubit>(context).logOut();
              },
              backGroundColor: defaultColor,
              height: 70,
              width: 150,
              text: 'تسجيل الخروج',
              googleImage: false
          ),
        ],
      ),
    );
  }
}
