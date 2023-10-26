import 'package:blocs/login/login_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:repository/authentication.dart';
import 'package:utility/color.dart';

import 'package:utility/util.dart';
import 'package:widget/patch/patch_dialog.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences _prefs;

  late String _vs = '';
  late bool _remember = false;
  late bool _authentication = false;

  final TextEditingController _cartNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _onload();
    Future.delayed(Duration.zero, () {
      patchDialog(context);
    });
  }

  _onload() async {
    try {
      _prefs = await SharedPreferences.getInstance();

      setState(() {
        _cartNoController.text = (_prefs.getString('id') ?? '');
        _passwordController.text = (_prefs.getString('pw') ?? '');
        _vs = (_prefs.getString('vs') ?? 'I 802_1.64_202304211100');
        _remember = (_prefs.getBool('password') ?? false);
        _authentication = (_prefs.getBool('authentication') ?? false);

        debugPrint('id: ${_cartNoController.text}');
        debugPrint('pw: ${_passwordController.text}');
        debugPrint('_remember: $_remember');
        debugPrint('_authentication: $_authentication');
      });
    } catch (e) {
      debugPrint('$e');
    }
  }

  _storage(id, pw, password, authentication) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('id', id);
    _prefs.setString('pw', pw);
    _prefs.setBool('password', password);
    _prefs.setBool('authentication', authentication);
  }

  bool _rememberCheck = false;

  _setRemember() {
    _rememberCheck = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ColoredBox(
        color: ColorEntries().background,
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (!_rememberCheck &&
                  (_rememberCheck != _remember ||
                      _rememberCheck != _authentication)) {
                _setRemember();

                context.read<LoginBloc>().add(LoginPageSet(
                    _cartNoController.text,
                    _passwordController.text,
                    _remember,
                    _authentication));
              }

              return Stack(
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Util.f(13),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          color: ColorEntries().banner,
                          width: double.infinity,
                          height: Util.h(50),
                          child: Row(
                            children: [
                              SizedBox(width: Util.w(30)),
                              Text(
                                _vs,
                                style: TextStyle(
                                  fontSize: Util.f(18),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: Util.h(61.5)),
                        LoginForm(
                          _cartNoController,
                          _passwordController,
                          _storage,
                        ),
                        SizedBox(height: Util.h(58)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: Util.w(17)),
                              width: Util.w(100),
                              height: Util.h(60),
                              decoration: BoxDecoration(
                                color: ColorEntries().banner,
                                borderRadius: BorderRadius.circular(7.5),
                              ),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorEntries().banner,
                                ),
                                onPressed: () {
                                  debugPrint("설정");
                                  patchDialog(context);
                                  // Navigator.push(context,
                                  //     MaterialPageRoute(builder: (_) {
                                  //   return SettingPage();
                                  // }));
                                },
                                icon: ImageIcon(
                                  const AssetImage(
                                    "setting_2.png",
                                    package: '../assets/images/menu',
                                  ),
                                  size: Util.w(22.5),
                                  color: Colors.white,
                                ),
                                label: Text(
                                  '설정',
                                  style: TextStyle(fontSize: Util.f(15)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
