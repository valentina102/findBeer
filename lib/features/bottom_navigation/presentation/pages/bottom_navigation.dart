import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:find_beer/features/home/presentation/pages/Home.dart';
import 'package:find_beer/features/location/presentation/pages/loading_screen.dart';
import 'package:find_beer/features/login/presentation/pages/login.dart';
import 'package:find_beer/features/profile/presentation/pages/profile.dart';
import 'package:find_beer/features/qr/presentation/pages/qr.dart';
import 'package:find_beer/features/scanner/presentation/pages/scanner.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class BottomNavigationPage
    extends BasePage<BottomNavigationState, BottomNavigationCubit> {
  final int index;
  const BottomNavigationPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  BottomNavigationCubit createBloc(BuildContext context) =>
      sl<BottomNavigationCubit>()..initial(index);
  @override
  Widget buildPage(BuildContext context, state, BottomNavigationCubit bloc) {
    return Scaffold(
        body: showPage(state.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/maps.png'),
              ),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/qr_code.png'),
              ),
              label: 'qr',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/home.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/scanner.png'),
              ),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/profile.png'),
              ),
              label: 'Profile',
            ),
          ],
          backgroundColor: AppColors.bone,
          elevation: 0,
          showSelectedLabels: true,
          unselectedLabelStyle: AppTextStyle(context).bottomNavigation,
          selectedLabelStyle: AppTextStyle(context).bottomNavigation,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.redWine,
          unselectedItemColor: AppColors.yellow,
          currentIndex: state.currentIndex,
          onTap: (int index) => bloc.changeIndex(index),
        ));
  }
}

Widget showPage(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return const LoadingScreen();
    case 1:
      return const QrPage();
    case 2:
      return const HomePage();
    case 3:
      return const ScannerPage();
    case 4:
      return const ProfilePage();
    default:
      return const LoginPage();
  }
}
