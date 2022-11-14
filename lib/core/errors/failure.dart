abstract class Failure {}

class AccountExistsWithDifferentCredentialFailure extends Failure {
  AccountExistsWithDifferentCredentialFailure({required this.message});

  final String message;
}

class InvalidCredentialFailure extends Failure {
  InvalidCredentialFailure({required this.message});

  final String message;
}

class GoogleSignInFailure extends Failure {
  GoogleSignInFailure({required this.message});

  final String message;
}

class FacebookSignInFailure extends Failure {
  FacebookSignInFailure({required this.message});

  final String message;
}

class SignOutFailure extends Failure {
  SignOutFailure({required this.message});

  final String message;
}
