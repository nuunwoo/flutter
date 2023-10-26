import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utility/color.dart';
import 'package:widget/button.dart';

class AppSettingsAlert extends StatelessWidget {
  const AppSettingsAlert(this.permanentlyDenied, this._permanentlyDenied,
      {super.key});

  final Iterable<MapEntry<Permission, PermissionStatus>> permanentlyDenied;
  final Function _permanentlyDenied;

  @override
  Widget build(BuildContext context) {
    List<Permission> permissions = permanentlyDenied.map((e) => e.key).toList();

    return PlatformWidget(
      cupertino: (_, __) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: AppSettingsAlertContents(
          permissions: permissions,
          permanentlyDenied: _permanentlyDenied,
        ),
      ),
      material: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppSettingsAlertContents(
          permissions: permissions,
          permanentlyDenied: _permanentlyDenied,
        ),
      ),
    );
  }
}

class AppSettingsAlertContents extends StatelessWidget {
  const AppSettingsAlertContents({
    required this.permissions,
    required this.permanentlyDenied,
    super.key,
  });

  final List<Permission> permissions;
  final Function permanentlyDenied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ColoredBox(
          color: ColorEntries().black,
          child: Container(
            width: 300,
            height: 200,
            color: ColorEntries().white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('권한 설정을 해주세요.'),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Button(onPressed: openAppSettings, child: Text('설정')),
                    const SizedBox(width: 10),
                    Button(
                      onPressed: () => permanentlyDenied(permissions),
                      child: const Text('완료'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
