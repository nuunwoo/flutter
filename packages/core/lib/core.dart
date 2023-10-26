import 'package:blocs/authentication/authentication_bloc.dart';
import 'package:core/core_view.dart';
import 'package:dependencies/dependencies.dart';

// import 'package:dependencies/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:repository/authentication.dart';

import 'package:utility/screen_ratio.dart';

class CoreApp extends StatefulWidget {
  const CoreApp({super.key});

  @override
  State<CoreApp> createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  late final AuthenticationRepository _authenticationRepository;

  Future asd() async {
    // Location location = Location();
    // debugPrint('serviceEnabled : ${Location.instance.serviceEnabled()}');
    // bool ison = await location.serviceEnabled();
    // if (!ison) {
    //   //if defvice is off
    //   bool isturnedon = await location.requestService();
    //   if (isturnedon) {
    //     print("GPS device is turned ON");
    //   } else {
    //     print("GPS Device is still OFF");
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();

    FlutterNativeSplash.remove();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  bool _isInitRatio = false;

  void _setIsInitRatio() {
    setState(() {
      _isInitRatio = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitRatio) {
      _setIsInitRatio();
      ScreenRatio().init(context);
    }
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const CoreView(),
      ),
    );
  }
}
