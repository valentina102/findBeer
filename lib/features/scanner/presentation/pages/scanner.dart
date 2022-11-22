import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/style/app_fonts.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/widgets/custom_button.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/scanner/presentation/bloc/scanner_cubit.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class ScannerPage extends BasePage<ScannerState, ScannerCubit> {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  ScannerCubit createBloc(BuildContext context) =>
      sl<ScannerCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, ScannerCubit bloc) {
    return Scaffold(
      body: Column(
        children: [
          const Header(title: 'Scanner', showIcon: true, showLogo: false),
          SizedBox(
            height: ScreenSize.height(context) * 0.3,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.width(context) * 0.05),
            child: CustomButton(
                backgroundColor: AppColors.brown,
                function: bloc.scanner,
                fontColor: AppColors.white,
                textButton: 'Scann',
                borderColor: AppColors.brown),
          ),
          SizedBox(
            height: ScreenSize.height(context) * 0.1,
          ),
          Text(
            state.data,
            style: AppTextStyle(context).header,
          )
        ],
      ),
    );
  }
}
