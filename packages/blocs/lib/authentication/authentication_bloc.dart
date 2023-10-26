import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:models/coordinate/coordinate.dart';
import 'package:repository/authentication.dart';
import 'package:repository/drivingMode.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationCoordinateRenewal>(_onAuthenticationCoordinateRenewal);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(_AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;

  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.inspect:
        return emit(const AuthenticationState.inspect());
      case AuthenticationStatus.authenticated:
        return emit(AuthenticationState.authenticated());
      case AuthenticationStatus.standby:
        return emit(AuthenticationState.standby());
      case AuthenticationStatus.progress:
        return emit(AuthenticationState.progress());
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  void _onAuthenticationCoordinateRenewal(
    AuthenticationCoordinateRenewal event,
    Emitter<AuthenticationState> emit,
  ) {
    final lng = event.lng;
    final lat = event.lat;

    final coordinate = Coordinate.dirty(LngLat(lng: lng, lat: lat));

    emit(state.copyWith(lngLat: coordinate));
  }

  // emit(
  //   state.copyWith(
  //     password: password,
  //     isValid: Formz.validate([password, state.cartNo]),
  //   ),
  // );
}
