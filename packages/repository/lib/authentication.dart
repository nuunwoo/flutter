import 'dart:async';

enum AuthenticationStatus {
  unknown,
  authenticated,
  standby,
  progress,
  unauthenticated,
  inspect
}

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    yield* _controller.stream;
  }

  void permisionCheck() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> logIn() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void isProgress(isProgress) {
    if (isProgress)
      _controller.add(AuthenticationStatus.progress);
    else
      _controller.add(AuthenticationStatus.standby);
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
