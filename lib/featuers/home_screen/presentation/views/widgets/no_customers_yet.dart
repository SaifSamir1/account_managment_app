





import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/widgets.dart';

class NoCustomersYet extends StatelessWidget {
  const NoCustomersYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              'ليس هناك زبائن بعد اضغط علي زر الاضافه الان لاضافة زبون',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 30,
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
  }
}
