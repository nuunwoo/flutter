part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

final class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}

final class AuthenticationCoordinateRenewal extends AuthenticationEvent {
  const AuthenticationCoordinateRenewal({required this.lng, required this.lat});

  final double lng;
  final double lat;

  @override
  List<Object> get props => [lng, lat];
}
