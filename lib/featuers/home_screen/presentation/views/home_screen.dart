import 'package:account_managment/core/utils/app_router.dart';
import 'package:account_managment/featuers/home_screen/data/modle/customer_model.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_cubit.dart';
import 'package:account_managment/featuers/home_screen/presentation/manger/home_cubit/home_states.dart';
import 'package:account_managment/featuers/home_screen/presentation/views/widgets/custom_drawer.dart';
import 'package:account_managment/featuers/home_screen/presentation/views/widgets/home_screen_body.dart';
import 'package:account_managment/featuers/home_screen/presentation/views/widgets/no_result_found.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constant.dart';
import '../../../../core/utils/hive_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CustomerModel> searchedForCharacters = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getAllCustomer();
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.grey,
      decoration: const InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedFOrItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = BlocProvider.of<HomeCubit>(context)
        .allCustomer
        .where((character) =>
            character.customerName!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    //فايدة ال set state هنا انها تغيرلي
    // الحاله علشان يحصل تحديث لل ui كل ما ادخل علي ال fun دي واقدر استغني عنها
    // لو عملت ال fun دي جوا ال cubit وعملت emit ل state جديده وبذلك هتحدث معايا ال ui
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.clear, color: Colors.white),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getUserData();
    return BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
      if (state is SignOutSuccessState) {
        GoRouter.of(context).pushReplacement(AppRouter.kAuthScreen);
        myBox!.put('notShowAuthScreen', 'false');
      }
    }, builder: (BuildContext context, state) {
      return Scaffold(
        key: key,
        appBar: AppBar(
          leading: _isSearching
              ? const BackButton(
                  color: Colors.white,
                )
              : IconButton(
                  onPressed: () {
                    key.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.dehaze)),
          elevation: 3.0,
          backgroundColor: defaultColor,
          title: _isSearching ? _buildSearchField() : buildHomeAppBarTitle(context),
          actions: _buildAppBarActions(),
        ),
        body:  SafeArea(
          child: searchTextController.text.isNotEmpty && searchedForCharacters.isEmpty ?
              NoResultFound(): HomeScreenBody(
            searchedForCharacters: searchedForCharacters,
          ),
        ),
        drawer: CustomDrawer(),
      );
    });
  }

  Row buildHomeAppBarTitle(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 30),
            const SizedBox(
              width: 5,
            ),
            ConditionalBuilder(
              condition:
                  BlocProvider.of<HomeCubit>(context).userModel.countryName ==
                      null,
              builder: (context) => SizedBox(
                  width: 30,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                  )),
              fallback: (context) => Text(
                '${BlocProvider.of<HomeCubit>(context).userModel.countryName}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
  }
}

