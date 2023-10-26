import 'dart:async';
import 'dart:io';

import 'package:dependencies/firebase_options.dart';
import 'package:dependencies/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:models/firebase/firebase.dart';
import 'package:utility/color.dart';
import 'package:utility/util.dart';
import 'package:widget/patch/process_widget.dart';

Future<dynamic> patchDialog(context) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => FutureBuilder(
      future: initFireBase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PatchDialogWidget();
        } else if (snapshot.hasError) {
          return Center(
            child: SizedBox(
              height: 200,
              child: Dialog(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Error: ${snapshot.error}'),
                    ElevatedButton(
                      onPressed: () => exit(0),
                      child: const Text('종료'),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    ),
  );
}

class PatchDialogWidget extends StatefulWidget {
  const PatchDialogWidget({super.key});

  @override
  State<PatchDialogWidget> createState() => _PatchDialogWidgetState();
}

class _PatchDialogWidgetState extends State<PatchDialogWidget> {
  String version = '0.0.0';

  int _versionCheck = 0;

  @override
  void initState() {
    super.initState();

    if (version != FirebaseRepostory.version) {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        debugPrint('${_versionCheck / 100}');
        setState(() {
          _versionCheck++;
        });
        if (_versionCheck == 100) {
          timer.cancel();
        }
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        // Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: Util.w(557),
        height: Util.h(331.5),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: Util.h(64.5),
              color: ColorEntries().banner,
              child: Text(
                "시스템 가동 프로세스",
                style: TextStyle(
                    fontSize: Util.f(20),
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                ProcessWidget(
                  name: '버전체크(앱,데이터)',
                  progress: _versionCheck,
                  color: Color(0xFF7AC4F5),
                ),
                ProcessWidget(
                  name: '다운로드(데이터)',
                  progress: 0,
                  color: Color(0xFF6BBD57),
                ),
                ProcessWidget(
                  name: '압축해제(데이터)',
                  progress: 0,
                  color: Color(0xFFD5D5D5),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: Util.w(1)),
                Flexible(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Color(0xFF7AC4F5),
                      fontSize: Util.f(13),
                    ),
                    child: const Column(
                      children: [
                        Text('현재 앱버전은 최신버전 입니다.'),
                        Text('(1.64)'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: Util.w(94.5)),
                Flexible(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: Util.f(13),
                      color: Color(0xFF727272),
                    ),
                    child: const Column(
                      children: [
                        Text('사용가능한 데이터가 아닙니다.'),
                        Text('최신 데이터 버전 : ${202304211100}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Util.h(11)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(
                      Util.w(38),
                      Util.h(10.5),
                      Util.w(38),
                      Util.h(10.5),
                    ),
                    backgroundColor: Color(0xFFF4F4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Util.w(5),
                      ),
                    ),
                  ),
                  child: Text(
                    '재시도',
                    style: TextStyle(
                      fontSize: Util.f(13),
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(width: Util.w(40)),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(
                      Util.w(38),
                      Util.h(10.5),
                      Util.w(38),
                      Util.h(10.5),
                    ),
                    backgroundColor: Color(0xFF2F3135),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Util.w(5),
                      ),
                    ),
                  ),
                  child: Text(
                    '종료',
                    style: TextStyle(
                      fontSize: Util.f(13),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future initFireBase() async {
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    final remoteConfig = FirebaseRemoteConfig.instance;

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 6),
    ));

    await remoteConfig.fetchAndActivate();

    final value = remoteConfig.getString('caddy_app');

    FirebaseRepostory().initFireBase(value);

    return FirebaseRepostory.version;
  } catch (e) {
    debugPrint('$e');

    // rethrow;

    return Future.error(e);
  }
}
