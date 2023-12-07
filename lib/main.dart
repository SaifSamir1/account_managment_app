import 'package:account_managment/core/utils/constant.dart';
import 'package:account_managment/featuers/customer_details/data/repositry/customer_repo_impl.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_router.dart';
import 'core/utils/bloc_observar.dart';
import 'core/utils/hive_service.dart';
import 'featuers/auth_screen/data/repositrise/auth_repo_impl.dart';
import 'featuers/auth_screen/presentation/manger/auth_screen_cubit/auth_screen_cubit.dart';
import 'featuers/auth_screen/presentation/manger/auth_screen_cubit/forget_password_cubit/forget_password_cubit.dart';
import 'featuers/auth_screen/presentation/manger/auth_screen_cubit/login_cubit/login_cubit.dart';
import 'featuers/auth_screen/presentation/manger/auth_screen_cubit/signup_cubit/signup_cubit.dart';
import 'featuers/customer_details/presentation/manger/customer_details_cubit/customer_details_cubit.dart';
import 'featuers/home_screen/data/repsetry/repositry/home_repo_impl.dart';
import 'methods.dart';

void main() async{

  //خاصه بالحاجات ال future
  WidgetsFlutterBinding.ensureInitialized();
  //كدا انا انشاءت ال box اللي هخزن فيه القيم اللي هو تبع ال hive
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  myBox = await openHiveBox("saifBox");

  userId8 = FirebaseAuth.instance.currentUser?.uid ?? '';

  showAuthScreen();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit(HomeRepoImpl())),
        BlocProvider(create: (context)=>CustomerDetailsCubit(CustomerRepoImpl())),
        BlocProvider(create: (context)=>AuthScreenCubit()),
        BlocProvider(create: (context)=>SignUpCubit(AuthRepoImpl())),
        BlocProvider(create: (context)=>LoginCubit(AuthRepoImpl())),
        BlocProvider(create: (context)=>ForgetPasswordCubit(AuthRepoImpl())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'ادارة حسابات الزبائن',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffFFFFFF),
        ),
      ),
    );
  }
}




