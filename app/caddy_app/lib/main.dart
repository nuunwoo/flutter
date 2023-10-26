import 'dart:io';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pages/appSetting/appSetting.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  List<Permission> permissions = [];

  if (Platform.isAndroid) {
    permissions = [
      Permission.camera,
      Permission.location,
      Permission.locationAlways,
      Permission.locationWhenInUse,
      Permission.microphone,
      Permission.storage,
    ];
  } else if (Platform.isIOS) {
    permissions = [
      Permission.camera,
      Permission.location,
      Permission.locationAlways,
      Permission.locationWhenInUse,
      Permission.microphone,
      Permission.photos,
    ];
  }

  try {
    await hideNavigationBar();

    await _setPermission(permissions);
  } catch (e) {
    exit(0);
  }
}

Future hideNavigationBar() async {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

Future<void> _setPermission(List<Permission> permissions) async {
  try {
    Map<Permission, PermissionStatus> statuses =
        await [...permissions].request();

    int isDeniedLength =
        statuses.entries.where((el) => el.value.isDenied).length;

    Iterable<MapEntry<Permission, PermissionStatus>> permanentlyDenied =
        statuses.entries.where((el) => el.value.isPermanentlyDenied);
    int isPermanentlyDeniedLength = permanentlyDenied.length;

    if (isDeniedLength > 0) {
      Future.delayed(
          const Duration(seconds: 0), () => _setPermission(permissions));
    } else {
      runApp(const CoreApp());
    }

    debugPrint(
        'isPermanentlyDeniedLength : ${isPermanentlyDeniedLength.toString()}');
    if (isPermanentlyDeniedLength > 0) {
      debugPrint(
          'isPermanentlyDeniedLength > 0 isPermanentlyDeniedLength > 0 isPermanentlyDeniedLength > 0');
      FlutterNativeSplash.remove();
      runApp(AppSettingsAlert(permanentlyDenied, _setPermanentlyDenied));
    }

    for (var entry in statuses.entries) {
      String name = entry.key.toString();
      PermissionStatus status = entry.value;
      // debugPrint('$name : $status');

      if (status.isGranted) {
        debugPrint('$name / 권한이 부여되었습니다.');
      }

      if (status.isDenied) {
        debugPrint('$name / 권한 부여가 거부되었습니다.');
      }

      if (status.isPermanentlyDenied) {
        debugPrint('$name / 권한 부여가 영구적으로 거부되었습니다.');
      }

      if (status.isRestricted) {
        debugPrint('$name / 권한이 제한되었습니다.');
      }
    }
  } catch (err) {
    debugPrint('_permission error : $err');

    await Future.delayed(
        const Duration(seconds: 0), () => _setPermission(permissions));
  }
}

Future<void> _setPermanentlyDenied(List<Permission> permissions) async {
  try {
    Map<Permission, PermissionStatus> statuses =
        await [...permissions].request();

    int isPermanentlyDeniedLength =
        statuses.entries.where((el) => el.value.isPermanentlyDenied).length;

    if (isPermanentlyDeniedLength == 0) {
      runApp(const CoreApp());
    }
  } catch (err) {
    debugPrint('_permission error : $err');

    await Future.delayed(
        const Duration(seconds: 0), () => _setPermission(permissions));
  }
}
