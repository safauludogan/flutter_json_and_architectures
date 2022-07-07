import 'package:flutter/material.dart';
import 'package:flutter_json_hardwareandro/202/package_learn_view.dart';
import 'package:flutter_json_hardwareandro/202/sheet_learn.dart';
import 'package:flutter_json_hardwareandro/202/state_manage/state_manage_learn_view.dart';
import 'package:flutter_json_hardwareandro/202/theme/light_theme.dart';
import 'package:flutter_json_hardwareandro/202/theme_learn_view.dart';
import 'package:flutter_json_hardwareandro/202/widget_size_enum_learn_view.dart';

import '303/callback_learn.dart';
import '303/part/part_of_learn.dart';
import '202/alert_learn.dart';
import '202/animated_learn.dart';
import '202/cache/secure_context/secure_context_learn.dart';
import '202/cache/shared_learn_cache.dart';
import '202/cache/shared_list_cache.dart';
import '202/form_learn_view.dart';
import '202/image_learn_202.dart';
import '202/oop_learn_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme().theme,
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   /* light theme settings */
      // ),
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      //   /* dark theme settings */
      // ),
      debugShowCheckedModeBanner: false,
      title: 'Json',
      home: const CallBackLearn(),
    );
  }
}

