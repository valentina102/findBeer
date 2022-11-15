import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/home/presentation/bloc/home_cubit.dart';
import 'package:find_beer/features/home/presentation/widgets/card_brewery.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class HomePage extends BasePage<HomeState, HomeCubit> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeCubit createBloc(BuildContext context) => sl<HomeCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, HomeCubit bloc) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: '', showIcon: true, showLogo: true),
          SizedBox(
            height: ScreenSize.height(context) * 0.7,
            child: ListView.builder(
              itemCount: state.breweryList.length,
                itemBuilder: (BuildContext context, int index){
                return CardBrewery(brewery:state.breweryList[index] );
                }),
          )
        ],
      ),
    );
  }
}
