import 'package:bloc/bloc.dart';
import 'package:find_beer/core/navigation/navigator.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void initial() {}

  void onFocusEmail(bool focused) async {
    emit(state.copyWith(isFocusEmail: focused));
  }

  void onFocusPassword(bool focused) async {
    emit(state.copyWith(isFocusPassword: focused));
  }
  void changeObscureText() {
    bool obscureText = state.obscureTextPassword;
    obscureText = !obscureText;
    emit(state.copyWith(obscureTextPassword: obscureText));
  }
  void login(){
    if (state.keyForm.currentState?.validate() ?? false) {
      AppNavigator.pushNamedAndRemoveUntil(
        Routes.BOTTOMNAVIGATION,
        arguments: 2,);
    }
  }
}
