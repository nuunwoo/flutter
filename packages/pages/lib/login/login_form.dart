import 'package:blocs/login/login_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';

class LoginForm extends StatefulWidget {
  const LoginForm(
    this._cartNoController,
    this._passwordController,
    this._storage, {
    super.key,
  });

  final TextEditingController _cartNoController;
  final TextEditingController _passwordController;
  final Function _storage;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorEntries().banner,
            borderRadius: BorderRadius.circular(7.5),
            boxShadow: [
              BoxShadow(
                color: ColorEntries().boxShadow,
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(2.5, 2.5),
              ),
            ],
          ),
          width: Util.w(557),
          height: Util.h(331.5),
          child: Column(
            children: [
              SizedBox(height: Util.h(57.5)),
              _CartNoInput(widget._cartNoController),
              SizedBox(height: Util.h(8)),
              _PasswordInput(widget._passwordController),
              SizedBox(height: Util.h(20.5)),
              const _CheckBox(),
              SizedBox(height: Util.h(55.5)),
              _LoginButton(
                widget._storage,
                widget._cartNoController,
                widget._passwordController,
              ),
            ],
          ),
        ));
  }
}

class _CartNoInput extends StatelessWidget {
  const _CartNoInput(this._cartNoController);
  final TextEditingController _cartNoController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.cartNo != current.cartNo,
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: Util.w(215),
              alignment: Alignment.centerRight,
              child: Text(
                'Cart No.',
                style: TextStyle(
                  fontSize: Util.f(27),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: Util.w(22.5)),
            Container(
              width: Util.w(237.5),
              height: Util.h(45),
              alignment: Alignment.center,
              child: TextField(
                key: const Key('loginForm_CartNoInput_textField'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: _cartNoController,
                onChanged: (cartNo) =>
                    context.read<LoginBloc>().add(LoginCartNoChanged(cartNo)),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  focusColor: Colors.white,
                  counterText: '',
                  labelText: '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput(this._passwordController);
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: Util.w(215),
              alignment: Alignment.centerRight,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: Util.f(27),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: Util.w(22.5)),
            Container(
              width: Util.w(237.5),
              height: Util.h(45),
              alignment: Alignment.center,
              child: TextField(
                key: const Key('loginForm_passwordInput_textField'),
                controller: _passwordController,
                onChanged: (password) => context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password)),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xffffffff),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorEntries().border,
                      width: Util.w(0.5),
                    ),
                  ),
                  focusColor: Colors.white,
                  counterText: '',
                  labelText: '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          (previous.remember != current.remember ||
              previous.authentication != current.authentication),
      builder: (context, state) {
        return SizedBox(
          height: Util.h(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => context
                    .read<LoginBloc>()
                    .add(LoginRememberChanged(!state.remember)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.6,
                      child: Checkbox(
                        activeColor: const Color(0xFFE39841),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        side: const BorderSide(width: 0),
                        value: state.remember,
                        onChanged: (onChanged) => context
                            .read<LoginBloc>()
                            .add(LoginRememberChanged(!state.remember)),
                      ),
                    ),
                    SizedBox(width: Util.w(7.5)),
                    Text(
                      '비밀번호 저장',
                      style: TextStyle(fontSize: Util.f(13)),
                    ),
                  ],
                ),
              ),
              SizedBox(width: Util.w(33)),
              InkWell(
                onTap: () => context
                    .read<LoginBloc>()
                    .add(LoginAuthenticationChanged(!state.authentication)),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.6,
                      child: Checkbox(
                        activeColor: const Color(0xFFE39841),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        side: const BorderSide(width: 0),
                        value: state.authentication,
                        onChanged: (onChanged) => context.read<LoginBloc>().add(
                            LoginAuthenticationChanged(!state.authentication)),
                      ),
                    ),
                    SizedBox(width: Util.w(7.5)),
                    Text(
                      '자동로그인',
                      style: TextStyle(fontSize: Util.f(13)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton(
    this._storage,
    this._cartNoController,
    this._passwordController,
  );
  final Function _storage;
  final TextEditingController _cartNoController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(
                      Util.w(32),
                      Util.h(10.5),
                      Util.w(32),
                      Util.h(10.5),
                    ),
                    backgroundColor: const Color(0xffffffff),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Util.w(7.5)))),
                onPressed: state.isValid
                    ? () {
                        if (state.remember && !state.authentication) {
                          _storage('', _passwordController.text, state.remember,
                              state.authentication);
                        } else if (state.authentication) {
                          _storage(
                              _cartNoController.text,
                              _passwordController.text,
                              state.remember,
                              state.authentication);
                        }

                        context.read<LoginBloc>().add(const FakeLogin());
                      }
                    : null,
                child: Text('로그인',
                    style: TextStyle(
                        fontSize: Util.f(13), color: const Color(0xff215273))),
              );
      },
    );
  }
}
