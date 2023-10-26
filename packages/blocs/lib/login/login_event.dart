part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginCartNoChanged extends LoginEvent {
  const LoginCartNoChanged(this.cartNo);

  final String cartNo;

  @override
  List<Object> get props => [cartNo];
}

final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginPageSet extends LoginEvent {
  const LoginPageSet(
      this.cartNo, this.password, this.remember, this.authentication);

  final String cartNo;
  final String password;
  final bool remember;
  final bool authentication;

  @override
  List<Object> get props => [cartNo, password, remember, authentication];
}

final class LoginRememberChanged extends LoginEvent {
  const LoginRememberChanged(this.remember);

  final bool remember;

  @override
  List<Object> get props => [remember];
}

final class LoginAuthenticationChanged extends LoginEvent {
  const LoginAuthenticationChanged(this.authentication);

  final bool authentication;

  @override
  List<Object> get props => [authentication];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

final class FakeLogin extends LoginEvent {
  const FakeLogin();
}
