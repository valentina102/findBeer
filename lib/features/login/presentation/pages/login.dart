import 'package:find_beer/core/base/base_page.dart';
import 'package:find_beer/features/login/presentation/bloc/login_cubit.dart';
import 'package:find_beer/injection_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends BasePage<LoginState, LoginCubit> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginCubit createBloc(BuildContext context) => sl<LoginCubit>()..initial();
  @override
  Widget buildPage(BuildContext context, state, LoginCubit bloc) {
    return Scaffold();
  }
}
