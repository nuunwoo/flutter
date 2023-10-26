import 'package:blocs/authentication/authentication_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pages/standby/standby_page.dart';
import 'package:repository/authentication.dart';
import 'package:pages/login/login_page.dart';

class CoreView extends StatefulWidget {
  const CoreView({super.key});

  @override
  State<CoreView> createState() => _CoreViewState();
}

class _CoreViewState extends State<CoreView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.all(Colors.white),
      )),

      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  Standby.route(),
                  (route) => false,
                );
              case AuthenticationStatus.standby:
                _navigator.pushAndRemoveUntil<void>(
                  Standby.route(),
                  (route) => false,
                );
              case AuthenticationStatus.progress:
                _navigator.pushAndRemoveUntil<void>(
                  // Progress.route(),
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.inspect:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      // onGenerateRoute: (_) => SplashPage.route(),

      onGenerateRoute: (_) => LoginPage.route(),
    );
  }
}
