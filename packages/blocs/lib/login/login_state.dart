part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.cartNo = const CartNo.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.remember = false,
    this.authentication = false,
  });

  final FormzSubmissionStatus status;
  final CartNo cartNo;
  final Password password;
  final bool isValid;
  final bool remember;
  final bool authentication;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    CartNo? cartNo,
    Password? password,
    bool? isValid,
    bool? remember,
    bool? authentication,
  }) {
    return LoginState(
      status: status ?? this.status,
      cartNo: cartNo ?? this.cartNo,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      remember: remember ?? this.remember,
      authentication: authentication ?? this.authentication,
    );
  }

  @override
  List<Object> get props => [
        status,
        cartNo,
        password,
        remember,
        authentication,
      ];
}
