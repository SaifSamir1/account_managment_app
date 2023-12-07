







import 'package:account_managment/featuers/home_screen/presentation/views/home_screen.dart';
import 'package:account_managment/featuers/home_screen/presentation/views/widgets/money_of_all_the_customers.dart';
import 'package:go_router/go_router.dart';

import '../../featuers/add_customer/presentation/views/add_customer.dart';
import '../../featuers/auth_screen/presentation/views/auth_screen.dart';
import '../../featuers/auth_screen/presentation/views/forget_password.dart';
import '../../featuers/auth_screen/presentation/views/widgets/password_recovery_succeeded.dart';
import '../../featuers/splash_view/presentation/views/splashView.dart';

abstract class AppRouter {

  static const kHomeScreen = '/homeScreen';
  static const kAddCustomerScreen = '/addCustomerScreen';
  static const kCustomerDetailsScreen = '/customerDetailsScreen';
  static const kAddProductScreen = '/addProductScreen';
  static const kDeductionScreen = '/deductionScreen';
  static const kPasswordRecoverySucceededScreen = '/passwordRecoverySucceededScreen';
  static const kAuthScreen = '/authScreen';
  static const kForgetPassword = '/forgetPassword';
  static const kAllMoneyScreen = '/allMoneyScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path:kHomeScreen,
          builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path:kAddCustomerScreen,
          builder: (context, state) => const AddCustomer(),
      ),
      GoRoute(
        path: kPasswordRecoverySucceededScreen,
        builder:  (context,state)=>  const PasswordRecoverySucceededScreen(),
      ),
      GoRoute(
        path: kAuthScreen,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder:  (context,state)=>  const ForgetPassword(),
      ),
      GoRoute(
        path: kAllMoneyScreen,
        builder:  (context,state)=>  const MoneyOfAllTheCustomers(),
      ),

    ],
  );
}
