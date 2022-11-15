import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:find_beer/features/profile/presentation/widgets/subTitle.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class ProfilePage extends BasePage<ProfileState, ProfileCubit> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfileCubit createBloc(BuildContext context) =>
      sl<ProfileCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, ProfileCubit bloc) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: ScreenSize.height(context),
          ),
          const Header(title: 'Profile', showIcon: true, showLogo: false),
          Container(
            height: ScreenSize.height(context)*0.45,
            width: ScreenSize.width(context)*0.3,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://data.whicdn.com/images/329872920/original.jpg',),
            ),
          ),
          Positioned(
            bottom: ScreenSize.height(context)*0.2,
            child: Container(
              child: Column
                (
                children: [
                  ProfileItem(title: 'Name',subTitle: 'Valentina Rendon',) ,
                  ProfileItem(title: 'Email',subTitle: 'valentina@gmail.com',) ,
                  ProfileItem(title: 'Cellphone',subTitle: '311 253 2950',) ,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
