part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = AuthenticationStatus.unknown,
    this.drivingMode = DrivingModeStatus.manual,
    this.lngLat = const Coordinate.pure(),
  });

  const AuthenticationState.unknown()
      : this(status: AuthenticationStatus.unknown);

  const AuthenticationState.authenticated()
      : this(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unauthenticated()
      : this(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.inspect()
      : this(status: AuthenticationStatus.inspect);

  const AuthenticationState.standby()
      : this(status: AuthenticationStatus.standby);

  const AuthenticationState.progress()
      : this(status: AuthenticationStatus.progress);

  const AuthenticationState.manual()
      : this(drivingMode: DrivingModeStatus.manual);

  const AuthenticationState.automatic()
      : this(drivingMode: DrivingModeStatus.automatic);

  final AuthenticationStatus status;

  final DrivingModeStatus drivingMode;

  final Coordinate lngLat;

  // AuthenticationState copyWith({
  //   AuthenticationStatus? status,
  //   LngLat? lngLat,
  // }) {
  //   lngLat ?? print('copyWith : ${lngLat!.lng}');
  //   return AuthenticationState(
  //     status: status ?? this.status,
  //     lngLat: lngLat ?? this.lngLat,
  //   );
  // }

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    DrivingModeStatus? drivingMode,
    Coordinate? lngLat,
  }) {
    return AuthenticationState(
      status: status ?? this.status,
      drivingMode: drivingMode ?? this.drivingMode,
      lngLat: lngLat ?? this.lngLat,
    );
  }

  @override
  List<Object> get props => [status, lngLat];
}
