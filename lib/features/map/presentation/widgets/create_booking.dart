import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/navigation/navigator.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/widgets/custom_button.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/map/presentation/bloc/map/map_cubit.dart';
import 'package:find_beer/features/login/presentation/widgets/text_form_field.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class CreateBooking extends  BasePage<MapState, MapCubit> {
  const CreateBooking({Key? key}) : super(key: key);

  @override
  MapCubit createBloc(BuildContext context) => sl<MapCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, MapCubit bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: 'Create Booking', showIcon: false, showLogo: false),
            SizedBox(height: ScreenSize.height(context) * 0.15),
            Form(
                key: state.keyForm,
                child: Column(
                  children: [
                    TextForm(
                      controller: state.breweryController,
                      hintText: 'Brewery',
                      onFocus: bloc.onFocusBrewery,
                      prefixIcon: Icons.liquor_outlined,
                      isFocus: state.isFocusBrewery,
                      suffixFunction: () {},
                      fieldPassword: false,
                      obscureText: false,
                      enable: false,
                      validateField: (String? value) {
                        return true;
                      },
                      invalidMessage: 'Ingress un email valido',
                    ),
                    SizedBox(height: ScreenSize.height(context) * 0.03),
                     TextForm(
                       controller: state.dateController,
                       hintText: 'Brewery',
                       onFocus: bloc.onFocusDate,
                       prefixIcon: Icons.date_range,
                       isFocus: state.isFocusDate,
                      suffixFunction: () {},
                      fieldPassword: false,
                      obscureText: false,
                      validateField: (String? value) {
                        return true;
                      },
                      invalidMessage: 'Ingress un email valido',
                    ),
                    SizedBox(height: ScreenSize.height(context) * 0.03),
                     TextForm(
                      controller: state.amountController,
                      hintText: 'Brewery',
                      onFocus: bloc.onFocusAmount,
                      prefixIcon: Icons.group,
                      isFocus: state.isFocusAmount,
                      suffixFunction: () {},
                      fieldPassword: false,
                      obscureText: false,
                      validateField: (String? value) {
                        return true;
                      },
                      invalidMessage: 'Ingress un email valido',
                    ),

                  ],
                )),
            SizedBox(
              height: ScreenSize.height(context) * 0.2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width(context) * 0.1),
              child: CustomButton(
                backgroundColor: AppColors.brown,
                function: () =>AppNavigator.pushNamedAndRemoveUntil(Routes.BOTTOMNAVIGATION,arguments: 1 ),
                fontColor: AppColors.white,
                textButton: 'Reserve',
                borderColor: AppColors.brown,),
            ),
          ],
        ),
      ),
    );
  }
}
