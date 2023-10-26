import 'package:dependencies/dependencies.dart';
import 'package:models/login/login.dart';

import 'package:repository/authentication.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginCartNoChanged>(_onCartNoChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPageSet>(_onLoginPageSet);
    on<LoginRememberChanged>(_onRememberChanged);
    on<LoginAuthenticationChanged>(_onAuthenticationChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<FakeLogin>(_fakeLogin);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onCartNoChanged(
    LoginCartNoChanged event,
    Emitter<LoginState> emit,
  ) {
    final cartNo = CartNo.dirty(event.cartNo);
    emit(
      state.copyWith(
        cartNo: cartNo,
        isValid: Formz.validate([state.password, cartNo]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.cartNo]),
      ),
    );
  }

  void _onLoginPageSet(
    LoginPageSet event,
    Emitter<LoginState> emit,
  ) {
    final cartNo = CartNo.dirty(event.cartNo);
    final password = Password.dirty(event.password);
    final remember = event.remember;
    final authentication = event.authentication;

    emit(
      state.copyWith(
        isValid: Formz.validate([password, cartNo]),
        remember: remember,
        authentication: authentication,
      ),
    );
  }

  void _onRememberChanged(
    LoginRememberChanged event,
    Emitter<LoginState> emit,
  ) {
    final remember = event.remember;

    emit(state.copyWith(remember: remember));
  }

  void _onAuthenticationChanged(
    LoginAuthenticationChanged event,
    Emitter<LoginState> emit,
  ) {
    final authentication = event.authentication;

    emit(state.copyWith(authentication: authentication));
  }

  void _fakeLogin(
    FakeLogin event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
        isValid: true, status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logIn();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.logIn();
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
