part of 'login_cubit.dart';

class LoginState {
  LoginState({
    required this.keyForm,
    required this.emailController,
    required this.passWordController,
    required this.isFocusEmail,
    required this.isFocusPassword,
    required this.obscureTextPassword,
  });
  final GlobalKey<FormState> keyForm;
  final TextEditingController emailController;
  final TextEditingController passWordController;
  final bool isFocusEmail;
  final bool isFocusPassword;
  final bool obscureTextPassword;
  factory LoginState.initial() => LoginState(
        emailController: TextEditingController(),
        passWordController: TextEditingController(),
        keyForm: GlobalKey<FormState>(),
        isFocusEmail: false,
        isFocusPassword: false,
        obscureTextPassword: true,
      );

  LoginState copyWith({
    TextEditingController? emailController,
    TextEditingController? passWordController,
    GlobalKey<FormState>? keyForm,
    bool? isFocusEmail,
    bool? isFocusPassword,
    bool? obscureTextPassword,
  }) {
    return LoginState(
      emailController: emailController ?? this.emailController,
      passWordController: passWordController ?? this.passWordController,
      keyForm: keyForm ?? this.keyForm,
      isFocusEmail: isFocusEmail ?? this.isFocusEmail,
      isFocusPassword: isFocusPassword ?? this.isFocusPassword,
      obscureTextPassword: obscureTextPassword ?? this.obscureTextPassword,
    );
  }
}
