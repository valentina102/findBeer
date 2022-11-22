import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/core/navigation/navigator.dart';
import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:find_beer/core/utils/validation.dart';
import 'package:find_beer/core/widgets/custom_button.dart';
import 'package:find_beer/core/widgets/header.dart';
import 'package:find_beer/features/login/presentation/bloc/login_cubit.dart';
import 'package:find_beer/features/login/presentation/widgets/text_form_field.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends BasePage<LoginState, LoginCubit> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginCubit createBloc(BuildContext context) => sl<LoginCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, LoginCubit bloc) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: 'Login', showIcon: false, showLogo: false),
            SizedBox(height: ScreenSize.height(context) * 0.15),
            Form(
                key: state.keyForm,
                child: Column(
                  children: [
                    TextForm(
                      controller: state.emailController,
                      hintText: 'Email',
                      onFocus: bloc.onFocusEmail,
                      prefixIcon: Icons.person,
                      isFocus: state.isFocusEmail,
                      suffixFunction: () {},
                      fieldPassword: false,
                      obscureText: false,
                      validateField: emailValidation,
                      invalidMessage: 'Ingress un email valido',
                    ),
                    SizedBox(height: ScreenSize.height(context) * 0.03),
                    TextForm(
                      controller: state.passWordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      onFocus: bloc.onFocusPassword,
                      isFocus: state.isFocusPassword,
                      suffixFunction: bloc.changeObscureText,
                      obscureText: state.obscureTextPassword,
                      fieldPassword: true,
                      validateField: passwordValidation,
                      invalidMessage: 'Ingresa una contraseña valida',
                    )
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
                  function: () =>bloc.login(),
                  fontColor: AppColors.white,
                  textButton: 'Login',
                  borderColor: AppColors.brown,),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.width(context) * 0.1),
              child: CustomButton(
                  backgroundColor: Colors.transparent,
                  function: () {},
                  fontColor: AppColors.brown,
                  textButton: 'Create Account',
                  borderColor: Colors.transparent,),
            ),
          ],
        ),
      ),
    );
  }
}
