import 'dart:async';

enum DrivingModeStatus {
  manual,
  automatic,
}

class DrivingModeRopository {
  final _controller = StreamController<DrivingModeStatus>();

  Stream<DrivingModeStatus> get status async* {
    yield DrivingModeStatus.manual;
    yield* _controller.stream;
  }

  void toggle() {
    print(DrivingModeStatus.values);
    _controller.add(DrivingModeStatus.manual);
  }

  void dispose() => _controller.close();
}
